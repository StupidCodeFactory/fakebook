class RecipientService

  def create(attributes)
    api.create_recipient(attributes)
  end

  def recipients
    api.fetch_recipients
  end

  def api
    @api ||= CoolPay.new
  end
end
