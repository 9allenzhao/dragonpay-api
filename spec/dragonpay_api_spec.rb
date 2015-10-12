require 'spec_helper'
require 'pry'

describe DragonpayApi do
  before do
    DragonpayApi.configure do |config|
      config.url = 'http://test.dragonpay.ph/Pay.aspx'
      config.merchant_id = 'merchant12345'
      config.secret_key = 'secret key'
    end

    @transaction = DragonpayApi::Transaction.new(
      txnid: '12345',
      amount: 500.00,
      ccy: 'php',
      description: 'description placeholder',
      email: 'customer@example.com'
    )
  end

  it 'has a version number' do
    expect(DragonpayApi::VERSION).not_to be nil
  end

  it 'does something useful' do
  end

  describe '#configure' do
    it 'sets configuration options' do
      config = DragonpayApi.configuration
      expect(config.url).to eq('http://test.dragonpay.ph/Pay.aspx')
      expect(config.merchant_id).to eq('merchant12345')
      expect(config.secret_key).to eq('secret key')
    end
  end

  describe '#initialize' do
    it 'sets fields' do
      expect(@transaction.txnid).to eq ('12345')
      expect(@transaction.amount).to eq (500.00)
      expect(@transaction.ccy).to eq ('php')
      expect(@transaction.description).to eq ('description placeholder')
      expect(@transaction.email).to eq ('customer@example.com')
      expect(@transaction.digest).to eq ('2df785d5866b9525ce8c38ab9ef5e953a330f310')
      # merchant12345:12345:500.00:php:description placeholder:customer@example.com:secret key
    end
  end

  describe '.send_payment' do
    it 'sends payment to payment switch' do
      expect(@transaction.pay).to eq (
        'http://test.dragonpay.ph/Pay.aspx'\
        '?merchant_id=merchant12345'\
        '&txnid=12345'\
        '&amount=500.00'\
        '&ccy=php'\
        '&description=description placeholder'\
        '&email=customer@example.com'\
        '&digest=2df785d5866b9525ce8c38ab9ef5e953a330f310'
      )
    end
  end

end
