class PaymentService
  def create(attributes)
    api.create_payment(attributes)
  end

  private

  def api
    @api ||= CoolPay.new
  end

end
