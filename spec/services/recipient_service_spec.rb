require "rails_helper"

RSpec.describe RecipientService do

  describe '#create' do
    let(:name) { 'John Doe' }

    it 'posts to coolpay', vcr: { cassette_name: :create_recipient } do
      expect(subject.create(name: name)).to be_instance_of(Recipient)
    end
  end


  describe '#recipients', vcr: { cassette_name: :fetch_recipients } do
    it 'returns a list of recipients' do
      expect(subject.recipients).to all(be_instance_of(Recipient))
      expect(subject.recipients.size).to eq(4)
    end
  end


  describe '#find' do
    it 'find the recipient', vcr: { cassette_name: :fetch_recipients } do
      expect(subject.find('df6cfea5-76a2-426e-af12-715e3dc6c0a8')).to have_attributes(name: 'John Doe', id: 'df6cfea5-76a2-426e-af12-715e3dc6c0a8')
    end
  end
end
