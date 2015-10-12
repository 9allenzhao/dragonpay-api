module DragonpayApi
  class Configuration
    attr_accessor :url
    attr_accessor :merchant_id
    attr_accessor :secret_key

    def initialize(options = {})
      options.each do |key, value|
        public_send("#{key}=", value)
      end
    end

  end
end
