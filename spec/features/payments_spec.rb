require "rails_helper"

RSpec.describe 'Payments Page', js: true do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
        uid: '123545', info: { email: 'test@example.com' })
  end
  let(:new_recipient_name) { 'John Doe' }

  it 'list payments', vcr: { cassette_name: 'feature_recipient', record: :new_episodes } do
    visit root_path

    click_on 'Login with Github'

    expect(page).to have_css 'h2', text: 'Your Recipients'

    fill_in 'recipient[name]', with: new_recipient_name

    click_on 'Create Recipient'

    expect(page).to have_css 'table tobdy tr td', text: new_recipient_name
  end
end
