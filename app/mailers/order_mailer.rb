class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def notify_order_placed(order)
    @order = order
    @poster = order.poster.user

    # puts"!!!!!poster#{@post_user.email}"
    # puts"!!!!!asker#{@ask_user.email}"

    mail(to: @poster.email,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
    #mail(to: @asker.email,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
  end
end
