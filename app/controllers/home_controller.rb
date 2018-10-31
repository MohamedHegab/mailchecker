class HomeController < ApplicationController
	def index

	end

	def check_email
		@response = Mailboxlayer::Client.new.mail_check(params[:email])
		render :index
	end
end