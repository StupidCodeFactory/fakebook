require "rails_helper"

RSpec.describe PaymentService do

  describe '#create', vcr: { cassette_name: :create_payment } do
    let(:payload) do
      { recipient_id: 'df6cfea5-76a2-426e-af12-715e3dc6c0a8', amount: 10.5, currency: 'GBP' }
    end

    it 'creates a payment' do
      expect(subject.create(payload)).to be_instance_of(Payment)
    end
  end


  describe '#payments', vcr: { cassette_name: :fetch_payments } do
    it 'returns a list of payments' do
      expect(subject.payments).to all(be_instance_of(Payment))
    end
  end
end
