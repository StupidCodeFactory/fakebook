class PaymentService
  def create(attributes)
    api.create_payment(attributes)
  end

  def payments
    api.fetch_payments
  end
  private

  def api
    @api ||= CoolPay.new
  end

end
