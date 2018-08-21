require "rails_helper"

RSpec.describe CoolPay do
  describe '#create_recipient' do
    let(:name) { 'John Doe' }

    it 'posts to coolpay', vcr: { cassette_name: :create_recipient }  do
      expect(subject.create_recipient(name: name)).
        to be_instance_of(Recipient).and have_attributes(
                                           name: 'Jake McFriend',
                                           id: 'e9a0336b-d81d-4009-9ad1-8fa1eb43418c'
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
end
