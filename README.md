[![Build Status](https://travis-ci.org/Nusii/nusii-ruby.png)](https://travis-ci.org/Nusii/nusii-ruby)

# Nusii

Ruby library for the [Nusii API](https://developer.nusii.com/#get-all-webhook-endpoints)

## Table of contents

  * [Installation](#installation)
  * [Setup](#setup)
  * [Usage](#usage)
    * [Account](#account)
    * [Clients](#clients)
    * [Sections](#sections)
    * [Line Items](#line-items)
    * [Proposals](#proposals)
    * [Proposal Activities](#proposal-activities)
    * [Webhooks](#webhooks)
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

## Usage

### Account

#### Account.me

```ruby
# Use this to retrieve the information from your account:

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

### Clients

### Sections

### Line Items

### Proposals

### Proposal Activities

### Webhooks

## Contributing

If you want to contribute, please follow these easy steps:

1. Fork it ( http://github.com/nusii/nusii-ruby/fork )
2. Create your feature branch (`git checkout -b improving-something`)
3. Commit your changes (`git commit -am 'Let's improve this!'`)
4. Push to the branch (`git push origin improving-something`)
5. Create new Pull Request

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).