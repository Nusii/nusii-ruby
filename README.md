[![Build Status](https://travis-ci.org/Nusii/nusii-ruby.png)](https://travis-ci.org/Nusii/nusii-ruby)

# Nusii

Ruby library for the [Nusii API](https://developer.nusii.com)

## Table of contents

  * [Installation](#installation)
  * [Setup](#setup)
  * [Example usage](#example-usage)
  * [Available methods by resource](#available-methods-by-resource)
  * [Contributing](#contributing)
  * [Usage](#contributing)

## Installation

To get the latest stable, add this to your Gemfile:

    gem 'nusii'

To get the latest code, add this:

    gem 'nusii', git: https://github.com/Nusii/nusii-ruby

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nusii

## Setup

The only thing you need to do is add you API KEY:

```ruby
require 'nusii-ruby'

Nusii.setup(:api_key => 'YOUR_API_KEY', :user_agent => 'your_user_agent')
```

## Example usage

### Listing resources

Use .list to retrieve a list of a resource

```ruby
> Nusii::Client.list
=> #<Nusii::ResponseObject:0x007fadfb6d8ac0
 @meta={"current_page"=>1, "next_page"=>2, "prev_page"=>nil, "total_pages"=>2, "total_count"=>29},
 @resource_class=Nusii::Client,
 @resources=
  [#<Nusii::Client:0x007fadfb6eb468
    @currency="USD",
    @email="martin@madeupcompany.com",
    @full_name="Martin",
    @id=35843,
    @locale="en",
    @name="Martin",
    @pdf_page_size="A4">,
    ... ]
```

You can also pass options such as `page` or `per`:

```ruby
> Nusii::Client.list(:per => 2, :page => 4)
=> #<Nusii::ResponseObject:0x007fadfb530c40
 @meta={"current_page"=>4, "next_page"=>5, "prev_page"=>3, "total_pages"=>15, "total_count"=>29},
 @resource_class=Nusii::Client,
 @resources=
  [#<Nusii::Client:0x007fadfb5313c0
    @currency="USD",
    @email="victor@madeupcompany.com",
    @full_name="Victor",
    @id=35835,
    @locale="es",
    @name="Victor",
    @pdf_page_size="A4">,
   #<Nusii::Client:0x007fadfb530e20
    @currency="EUR",
    @email="altheasmith@madeupcompany.com",
    @full_name="Althea",
    @id=35834,
    @locale="en",
    @name="Althea",
    @pdf_page_size="A4">]>
```


Any ResponseObject instance also has the methods `next_page` and `prev_page` which will automatically make the requests based on the current search.

```ruby
> response = Nusii::Client.list(:per => 4, :page => 2)
=> #<Nusii::ResponseObject:0x007fadfb0bd028
 @meta={"current_page"=>2, "next_page"=>3, "prev_page"=>1, "total_pages"=>8, "total_count"=>29},
 @resource_class=Nusii::Client,
 @resources= [...]

> response.prev_page
=> #<Nusii::ResponseObject:0x007f8df2c3b518
 @meta={"current_page"=>1, "next_page"=>2, "prev_page"=>nil, "total_pages"=>8, "total_count"=>29},
 @resource_class=Nusii::Client,
 @resources=[...]
```

`Nusii::ListItem` has also a method called `.list_by_section` that accepts a `section_id` as the first argument and retrieves ListItems under that section_id

### Getting a single resource

Use `.get` to retrieve a single resource

```ruby
> Nusii::Section.get 309405
=> #<Nusii::Section:0x007f8df3020778
 @id=309405,
 @body=
  "<p>We are a web design studio with offices in Madrid and Barcelona and we're lucky enough to work with people from all over the world./p>",
 @currency="EUR",
 @include_total=false,
 @name="Introduction",
 ...">
```

### Creating and updating resources

You can create a resource with the class method `.create` by passing a hash of arguments:

```ruby
> Nusii::Client.create({:name => 'Laura Palmer', :email => 'laura.palmer@tphs.com'})
=> #<Nusii::Client:0x007f8df2b6aa58
 @currency="USD",
 @email="laura.palmer@tphs.com",
 @full_name="Laura Palmer",
 @id=35947,
 @locale="en",
 @name="Laura Palmer",
 @pdf_page_size="A4">
```

You can also create them by using `#save` on a new object:

```ruby
client = Nusii::Client.new({:name => 'Laura Palmer', :email => 'laura.palmer@tphs.com'})
=> #<Nusii::Client:0x007f8df2b226e0 @email="laura.palmer@tphs.com", @name="Laura Palmer">
> client.save
=> #<Nusii::Client:0x007f8df2abacc0
 @currency="USD",
 @email="laura.palmer@tphs.com",
 @full_name="Laura Palmer",
 @id=35948,
 @locale="en",
 @name="Laura Palmer",
 @pdf_page_size="A4">
```

Any resource with a valid `id` value can be updated with the same method, `#save`.

```ruby
> client.name = 'Sheryl Lee'
=> "Sheryl Lee"
> client.save
=> #<Nusii::Client:0x007f8df21521b0
 @currency="USD",
 @email="laura.palmer@tphs.com",
 @full_name="Sheryl Lee",
 @id=35949,
 @locale="en",
 @name="Sheryl Lee",
 @pdf_page_size="A4">
```

### Deleting resources

Just as happens with creation, a resource can be deleted by a class method `.destroy` passign a valid id or with `#destroy` on a instance.

```ruby
> Nusii::WebhookEndpoint.destroy(54)
=> true
```

```ruby
> webhook = Nusii::WebhookEndpoint.get(55)
=> #<Nusii::WebhookEndpoint:0x007f8df2302a28 @events=["proposal_updated"], @id=55, @target_url="http://example.com">
> webhook.destroy
=> true
```

### Sending a proposal

With any `Proposal` object you can use the method `#send_proposal`. You need to pass at least the email of the client you want the existing proposal sent to. Please [refer to the API](https://developer.nusii.com/#send-a-proposal) for more information.

```ruby
> proposal.send_proposal(:email => 'lucas.tazmily@myclient.com')
=> {"status"=>"pending", "sent_at"=>"2017-12-11T12:37:12.593Z", "sent_at_in_ms"=>1512995832000, "sender_id"=>nil, "sender_name"=>nil}
```

### Retrieving account information

Use `Account.me` to get the information from your account

```ruby
> Nusii::Account.me
=> #<Nusii::Account:0x007fb042f30350
 @address="Calle Mayor, 23",
 @city="Madrid",
 @country="Spain",
 @country_name="Spain",
 @currency="EUR",
 @email="michael@test.com",
 @id=44,
 @name="Michael Account",
 @postcode="28017",
 @subdomain="michael",
 @telephone="123456789",
 @web="nusii.com">
```

### Rate limiting

There is a rate limit in Nusii API of 100 requests every 30 seconds. After every request, a class variable in `Nusii` will get updated so you can check if you are reaching the limit

```ruby
> Nusii.rate_limit_remaining
=> 98
> Nusii::Account.me
=> #<Nusii::Account:0x007f8df20fa028 ...>
> Nusii.rate_limit_remaining
=> 97
```

There's another variable called `rate_limit_retry_after` that will store the amount of time, in seconds, that you have to wait if you have reached the limit.

## Available methods by resource

#### Account

* Nusii::Account.me

#### Clients

* Nusii::Client.list
* Nusii::Client.get
* Nusii::Client.create
* Nusii::Client#save
* Nusii::Client.destroy
* Nusii::Client#destroy

#### Sections

* Nusii::Section.list
* Nusii::Section.get
* Nusii::Section.create
* Nusii::Section#save
* Nusii::Section.destroy
* Nusii::Section#destroy

#### Line Items

* Nusii::LineItem.list
* Nusii::LineItem.list_by_section
* Nusii::LineItem.create_with_section
* Nusii::LineItem#save
* Nusii::LineItem.destroy
* Nusii::LineItem#destroy

#### Proposals

* Nusii::Proposal.list
* Nusii::Proposal.get
* Nusii::Proposal.create
* Nusii::Proposal#save
* Nusii::Proposal.destroy
* Nusii::Proposal#destroy
* Nusii::Proposal#send_proposal

#### Proposal Activities

* Nusii::Proposal.list
* Nusii::Proposal.get

#### Webhook Enpoints

* Nusii::WebhookEndpoint.list
* Nusii::WebhookEndpoint.get
* Nusii::WebhookEndpoint.create
* Nusii::WebhookEndpoint#save
* Nusii::WebhookEndpoint.destroy
* Nusii::WebhookEndpoint#destroy

## Contributing

If you want to contribute, please follow these easy steps:

1. Fork it ( http://github.com/nusii/nusii-ruby/fork )
2. Create your feature branch (`git checkout -b improving-something`)
3. Commit your changes (`git commit -am 'Let's improve this!'`)
4. Push to the branch (`git push origin improving-something`)
5. Create new Pull Request

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).
