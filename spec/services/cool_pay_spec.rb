require "rails_helper"

RSpec.describe CoolPay do
  describe '#create_recipient' do
    let(:name) { 'John Doe' }

    it 'posts to coolpay', vcr: { cassette_name: :create_recipient } do
      expect(subject.create_recipient(name: name)).
        to be_instance_of(Recipient).and have_attributes(
                                           name: 'John Doe',
                                           id: 'df6cfea5-76a2-426e-af12-715e3dc6c0a8'
                                         )
    end

    context 'without authentication', vcr: { cassette_name: :no_authentication } do
      it 'raises a CoolPay::APIError' do
        expect{
          subject.create_recipient(name)
        }.to raise_error CoolPay::APIError, 'Please provide a good token'
      end
    end
  end

  describe '#fetch_recipients', vcr: { cassette_name: :fetch_recipients } do
    it 'returns a list of recipients' do
      expect(subject.fetch_recipients).to all(be_instance_of(Recipient))
      expect(subject.fetch_recipients.size).to eq(2)
    end

  end
end
