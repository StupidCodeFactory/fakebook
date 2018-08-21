class PaymentsController < ApplicationController
  def new
    @recipient = recipient_service.find(params[:recipient_id])
  end

  private

  def recipient_service
    RecipientService.new
  end

end
