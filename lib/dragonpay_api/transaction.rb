module DragonpayApi
  class Transaction
    attr_accessor :merchant_id
    attr_accessor :txnid
    attr_accessor :amount
    attr_accessor :ccy
    attr_accessor :description
    attr_accessor :email
    attr_accessor :digest

    def initialize(options = {})
      @txnid = options[:txnid]
      @amount = options[:amount]
      @ccy = options[:ccy]
      @description = options[:description]
      @email = options[:email]
      @digest = get_digest

      @url = options[:url] || DragonpayApi.configuration.url
    end

    def pay
      url = payment_url
      # TODO send payment pending
    end

    private
    def get_digest
      merchant_id = DragonpayApi.configuration.merchant_id
      secret_key = DragonpayApi.configuration.secret_key
      parameters = [
        merchant_id,
        @txnid,
        "%.2f" % @amount,
        @ccy,
        @description,
        @email,
        secret_key
      ]

      message = parameters.join(':')
      Digest::SHA1.hexdigest message
    end

    def payment_url
      url = DragonpayApi.configuration.url
      merchant_id = DragonpayApi.configuration.merchant_id

      "#{url}"\
      "?merchant_id=#{merchant_id}"\
      "&txnid=#{@txnid}"\
      "&amount=#{"%.2f" % @amount}"\
      "&ccy=#{@ccy}"\
      "&description=#{@description}"\
      "&email=#{@email}"\
      "&digest=#{@digest}"
    end

  end
end
