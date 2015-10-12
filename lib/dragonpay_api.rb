require 'dragonpay_api/version'
require 'dragonpay_api/configuration'
require 'dragonpay_api/transaction'
require 'digest/sha1'
require 'pry'

module DragonpayApi
  extend self

  def configuration
    @config ||= Configuration.new
  end

  def configure
    yield configuration
  end
end
