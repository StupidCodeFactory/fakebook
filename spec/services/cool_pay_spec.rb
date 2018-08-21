require "rails_helper"

RSpec.describe CoolPay do
  describe '#create_recipient' do
    let(:name) { 'John Doe' }

    it 'posts to coolpay', vcr: { cassette_name: :create_recipient } do
      expect(subject.create_recipient(name: name)).
        to include('name' => 'John Doe', 'id' => 'e211830d-9181-4a2e-bf8c-28bdd74f125f')
    end

    context 'without authentication', vcr: { cassette_name: :no_authentication } do
      it 'raises a CoolPay::APIError' do
        expect(subject).to receive(:auth_token).and_return(nil)
        expect{
          subject.create_recipient(name)
        }.to raise_error CoolPay::APIError, 'Please provide a good token'
      end
    end
  end

  describe '#fetch_recipients', vcr: { cassette_name: :fetch_recipients } do
    it 'returns a list of recipients' do
      expect(subject.fetch_recipients).to all(include('name', 'id'))
      expect(subject.fetch_recipients.size).to eq(4)
    end
  end


  describe '#create_recipient', vcr: { cassette_name: :create_payment } do
    let(:payload) do
      { recipient_id: 'df6cfea5-76a2-426e-af12-715e3dc6c0a8', amount: 10.5, currency: 'GBP' }
    end

    it 'creates a payment' do
      expect(subject.create_payment(payload)).to include('id', 'amount', 'currency', 'recipient_id', 'status')
    end
  end

end
