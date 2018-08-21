class RecipientsController < ApplicationController
  def index
    @recipient = Recipient.new
  end

  def create
    recipient_service.create recipient_params
  end

  private

  def recipient_service
    RecipientService.new
  end

  def recipient_params
    params.require(:recipient).permit(:name)
  end
end
