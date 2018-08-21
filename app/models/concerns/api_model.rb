module APIModel
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Model
    include ActiveModel::Attributes
  end

  def persisted?
    id.present?
  end

end
