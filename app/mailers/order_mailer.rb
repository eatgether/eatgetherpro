class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

	def notify_order_met(order)
		@order = order
    @post = order.post
    @poster_user = @order.poster_user
    @asker_user = @order.asker_user
		@recipients = [@poster_user.email, @asker_user.email]
		@admin = User.where(is_admin: true)
		@admin_recipients = @admin.select(:email).map(&:email)

		mail(to: @recipients, bcc: @admin_recipients, subject: "[Eatgether]恭喜您完成邀约。我们期待您对本次晚餐最珍贵的反馈！#{order}")
	end


	def notify_admin_cancel(order)
		@order = order
    @post = order.post
    @poster_user = @order.poster_user
    @asker_user = @order.asker_user
		@admin = User.where(is_admin: true)
		@admin_recipients = @admin.select(:email).map(&:email)

		mail(to: @admin_recipients,subject: "[Eatgether-ToAdmin]有用户申请取消邀约，请尽快登录后台处理。#{order}")
	end


	def notify_order_cancelled(order)
		@order = order
    @post = order.post
    @poster_user = @order.poster_user
    @asker_user = @order.asker_user
		@recipients = [@poster_user.email, @asker_user.email]

		mail(to: @recipients,subject: "[Eatgether]您的预约已取消。欢迎您重新登录建立新邀约。#{order}")
	end

	def notify_order_revived(order)
    @order = order
    @post = order.post
    @poster_user = @order.poster_user
    @asker_user = @order.asker_user
		@recipients = [@poster_user.email, @asker_user.email]

		mail(to: @recipients,subject: "[Eatgether]您的预约已重启。以下是您约会详细信息。#{order}")
	end

end
