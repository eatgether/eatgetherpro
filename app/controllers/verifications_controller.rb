class VerificationsController < ApplicationController
  def create
  current_user.verification_code =  1_000_000 + rand(10_000_000 - 1_000_000)
  current_user.save

  to = current_user.mobile_number
  if to[0] = "0"
    to.sub!("0", '+44')
  end

  @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
  @twilio_client.account.sms.messages.create(
    :from => ENV['TWILIO_PHONE_NUMBER'],
    :to => to,
    :body => "Your verification code is #{current_user.verification_code}."
  )
  redirect_to edit_user_registration, :flash => { :success => "A verification code has been sent to your mobile. Please fill it in below." }
  return
end
end
