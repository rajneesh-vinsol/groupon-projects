class SendOrderConfirmationEmailJob < ActiveJob::Base

  def perform(order_id)
    OrderMailer.send_order_confirmation_email(order_id).deliver_now
  end

end
