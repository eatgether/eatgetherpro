class OrderMailer < ApplicationMailer
  include Roadie::Rails::Automatic

  def notify_order_placed(order)
    @order = order
    @poster = order.poster
    @asker  = order.asker

    puts"!!!!!poster#{@poster}"
    puts"!!!!!asker#{@asker}"

    mail(to: @asker.email,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
    mail(to: @poster.email,subject: "[eatgether] 您的预约已匹配。以下是您此次约会详细信息。#{order}")
  end
end
