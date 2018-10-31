module ApplicationHelper
	def render_message(response)
		if response
			if response['smtp_check'] 
				status = 'success'
				message = "This email has SMTP"
			elsif response['smtp_check'].nil?
				status = 'danger'
				message = response['error']['info']
			else
				status = 'warning'
				message = "This email doesn't have a SMTP"
			end

		  content_tag(:div, message, class: "alert alert-#{status}")
		end
	end
end
