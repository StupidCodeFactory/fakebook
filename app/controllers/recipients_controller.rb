class RecipientsController < ApplicationController
  def index
    @recipient  = Recipient.new
    @recipients = recipient_service.recipients
    @payments   = payment_service.payments
  end

  def create
    recipient_service.create recipient_params
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name)
  end

  def recipient_service
    @recipient_service ||= RecipientService.new
  end

  def payment_service
    @payment_service ||= PaymentService.new
  end
end
