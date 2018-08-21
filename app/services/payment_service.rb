class PaymentService

  def create(attributes)
    Payment.new(api.create_payment(payment: attributes))
  end

  def payments
    api.fetch_payments.map { |response| Payment.new(response) }
  end

  private

  def api
    @api ||= CoolPay.new
  end

end
