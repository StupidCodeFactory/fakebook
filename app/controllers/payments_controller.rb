class PaymentsController < ApplicationController

  def new
    @recipient = recipient_service.find(params[:recipient_id])
    @payment   = Payment.new
  end

  def create
    payment_service.create(
      payment_params.merge(recipient_id: params[:recipient_id])
    )
    flash[:notice] = 'Payment sent'
    redirect_to recipients_path
  end

  private

  def recipient_service
    RecipientService.new
  end

  def payment_service
    PaymentService.new
  end

  def payment_params
    params.require(:payment).permit(:currency, :amount)
  end
end
