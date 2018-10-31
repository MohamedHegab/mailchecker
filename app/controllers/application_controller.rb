class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :throttle

	THROTTLE_MAX_REQUESTS = 5
	THROTTLE_TIME_WINDOW = 60

  def throttle
    count = cookies[:key]

    unless count
			cookies[:key] = {value: 0, expires: THROTTLE_TIME_WINDOW.seconds}
      return true
    end

    if count.to_i >= THROTTLE_MAX_REQUESTS
      render :json => {:message => "You have fired too many requests. Please wait for some time."}, :status => 429
      return
    end
    count = count.to_i + 1
    true
  end
end
