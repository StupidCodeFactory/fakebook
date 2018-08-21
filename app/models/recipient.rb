class Recipient
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :id,   :string
end
