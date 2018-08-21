require "rails_helper"

RSpec.describe 'Payments Page', js: true do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
        uid: '123545', info: { email: 'test@example.com' })
  end
  let(:new_recipient_name) { 'John Doe' }

  it 'list payments', vcr: { cassette_name: 'feature_recipient' } do
    visit root_path

    click_on 'Login with Github'

    expect(page).to have_css 'h2', text: 'Your Recipients'

    fill_in 'recipient[name]', with: new_recipient_name

    click_on 'Create Recipient'

    expect(page).to have_css 'table tbody tr td:first-child', text: new_recipient_name

    within 'table tbody tr:first-child' do
      click_on 'Send Money'
    end

    fill_in 'payment[amount]', with: 10.5
    select 'British Pound', from: 'payment[currency]'
    click_on 'Pay!'

    expect(page).to have_css '.notice', text: 'Payment sent'

  end
end
