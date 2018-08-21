class RecipientService

  def create(attributes)
    api.create_recipient(attributes)
  end

  def find(id)
    recipients.detect { |recipient| recipient.id == id }
  end

  def recipients
    @recipients ||= api.fetch_recipients
  end

  def api
    @api ||= CoolPay.new
  end
end
