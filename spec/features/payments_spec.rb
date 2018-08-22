require "rails_helper"

RSpec.describe 'Payments Page' do
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

    within page.first('table') do
      within page.first('tbody tr') do
        expect(page).to have_css 'td:first-child', text: new_recipient_name
        click_on 'Send Money'
      end
    end

    fill_in 'payment[amount]', with: 10.5
    select 'British Pound', from: 'payment[currency]'
    click_on 'Pay!'

    expect(page).to have_css '.alert.is-success', text: 'Payment sent'

    within page.all('table').last do
      within page.find('tbody tr:first-child') do
        expect(page).to have_css 'td:first-child', text: '10.5'
      end
    end
  end
end
