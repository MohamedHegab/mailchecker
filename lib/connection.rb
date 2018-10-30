require 'faraday'
require 'json'

class Connection
	Base = 'http://apilayer.net/api'.freeze
	access_key = Env['mailboxlayer_apikey']

	def self.api
		Faraday.new(url: BASE) do |faraday|
			faraday.response :logger do | logger |
		    logger.filter(/(access_key=)(\w+)/,'\1[REMOVED]')
		  end
			faraday.adapter Faraday.default_adapter
			faraday.headers['Content-Type'] = 'application/json'
		end
	end
end