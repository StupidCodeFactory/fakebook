class RecipientsController < ApplicationController
  def index
    @recipient = Recipient.new
  end

end
