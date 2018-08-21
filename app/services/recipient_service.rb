class RecipientService

  def create(attributes)
    Recipient.new(api.create_recipient(recipient: attributes))
  end

  def find(id)
    recipients.detect { |recipient| recipient.id == id }
  end

  def recipients
    @recipients ||= api.fetch_recipients.map { |response|  Recipient.new(response) }
  end

  def api
    @api ||= CoolPay.new
  end
end
