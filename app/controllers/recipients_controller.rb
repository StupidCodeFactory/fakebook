class RecipientsController < ApplicationController
  helper_method :recipient_service

  def index
    load_page_data
  end

  def create
    recipient_service.create recipient_params
    load_page_data
    @recipient  = Recipient.new
    @recipients = recipient_service.recipients
    @payments   = payment_service.payments

    render :index
  end

  private

  def load_page_data
    @recipient  = Recipient.new
    @recipients = recipient_service.recipients
    @payments   = payment_service.payments
  end

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
