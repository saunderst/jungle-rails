class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def confirmation_email(name, email, order, total)
    @name = name
    @item = LineItem.where(order_id: order)
    @total = total
    mail(to: email, subject: "Your Jungle order confirmation: Order #{order}.")
  end
end
