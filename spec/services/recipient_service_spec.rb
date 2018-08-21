require "rails_helper"

RSpec.describe RecipientService do
  describe '#find' do
    it 'find the recipient', vcr: { cassette_name: :fetch_recipients } do
      expect(subject.find('df6cfea5-76a2-426e-af12-715e3dc6c0a8')).to have_attributes(                                           name: 'John Doe', id: 'df6cfea5-76a2-426e-af12-715e3dc6c0a8')
    end
  end
end
