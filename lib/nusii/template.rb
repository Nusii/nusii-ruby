module Nusii
  class Template < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List

    attr_accessor :id, :name, :account_id, :created_at,
                  :public_template, :dummy_template

  end
end
