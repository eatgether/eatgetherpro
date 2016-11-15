class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def notify_order_placed(order)
    @order = order
    @poster = order.poster.user
		@asker = order.asker.user
		@recipients = [@poster.email, @asker.email]
    # puts"!!!!!poster#{@post_user.email}"
    # puts"!!!!!asker#{@ask_user.email}"

    mail(to: @recipients,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
  end

	def notify_order_cancelled(order)
		@order = order
		@poster = order.poster.user

		mail(to: @poster.email,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
	end

end
