class RecipientsController < ApplicationController
  helper_method :recipient_service

  def index
    load_page_data
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    if @recipient.valid?
      recipient_service.create recipient_params
      flash['notice'] = 'Recipient Created'
      @recipient  = Recipient.new
      redirect_to action: :index
    else
      load_page_data
      flash.now['alert'] = @recipient.errors.full_messages.to_sentence
      render :index
    end

  end

  private

  def load_page_data
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
