module Mailboxlayer
  class Client
    API_ENDPOINT = 'http://apilayer.net/api'.freeze
    ACCESS_KEY = ENV['mailboxlayer_apikey'].strip
    
    def mail_check(mail)
      request(
        http_method: :get,
        endpoint: "check", 
        params: {
          access_key: ACCESS_KEY, 
          email: mail, 
          smtp: 1, 
          format: 1
        }
      )
    end

    private

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        client.use Mailboxlayer::Exceptions
        client.response :logger do | logger |
          logger.filter(/(access_key=)(\w+)/,'\1[REMOVED]')
        end
        client.options[:open_timeout] = 2
        client.options[:timeout] = 5
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      response_body = response.is_a?(Faraday::Response) ? response.body : response[:body].to_json
      JSON.parse(response_body)
    end
  end
end