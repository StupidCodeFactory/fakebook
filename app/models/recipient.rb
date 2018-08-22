class Recipient
  include APIModel

  attribute :name, :string
  attribute :id,   :string
  validates_presence_of :name
end
