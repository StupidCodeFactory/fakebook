class Payment
  include APIModel

  attribute :id,           :string
  attribute :amount,       :float
  attribute :currency,     :string
  attribute :recipient_id, :string
  attribute :status,       :string

end
