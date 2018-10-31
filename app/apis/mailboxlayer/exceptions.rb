class Mailboxlayer::Exceptions < Faraday::Middleware
  def call(env)
  	fail_hash = {body: {success: false, error: { info: "The server is either unavailable or is not currently accepting requests. Please try again in a few minutes"}}}
    begin
      @app.call(env)
    rescue Faraday::Error::ConnectionFailed => e
		  return fail_hash
    rescue Faraday::Error::TimeoutError => e
    	return fail_hash
    end
  end
end
