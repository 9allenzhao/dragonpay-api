# DragonpayApi

Transact through Dragonpay API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dragonpay_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonpay_api

## Configure

``` ruby
# config/initializers/dragonpay_api.rb
require 'dragonpay_api'

DragonpayApi.configure do |config|
  config.merchant_id = 'merchantid12345'
  config.secret_key  = 'secretkey12345'
  config.url         = 'http://test.dragonpay.ph/Pay.aspx'
end
```

## Usage

``` ruby
transaction = DragonpayApi::Transaction.new(
  txnid: 'transactionid12345',
  amount: 500.00,
  ccy: 'php',
  description: 'optional description',
  email: 'customer@email.com'
)

transaction.pay

TODO: under development
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karloescota/dragonpay-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

Copyright (c) 2015 Karlo Escota. https://github.com/karloescota
