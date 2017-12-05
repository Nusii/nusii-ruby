module Nusii
  class Connection

    delegate :get, :post, :put, :delete,
      :to => :connection

    HOST = "https://app.nusii.com"

  private

    def connection
      @connection ||= Faraday.new(HOST) do |conn|
        conn.adapter :net_http
        conn.headers['Authorization'] = "Token token=#{Nusii.api_key}"
        conn.headers['User-Agent']     = Nusii.user_agent
        conn.headers['Content-Type']  = 'application/json'
      end
    end

  end
end