require 'json'

class Mailer < ActionMailer::Base
	layout 'email'
	default :from => "notify@btcpricealerts.com"

	def email_alert(payload)
		@payload = JSON.parse(payload)
		mail(:to => @payload["destination"],
					:subject => "BTC moves to #{@payload["price"]}")
	end
end
