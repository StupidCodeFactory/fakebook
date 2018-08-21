class RecipientService
  def create(attributes)
    api.create_recipient(attributes)
  end

  def api
    @api ||= CoolPay.new
  end
end
