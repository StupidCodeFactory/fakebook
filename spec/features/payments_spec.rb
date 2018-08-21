require "rails_helper"

RSpec.describe 'Payments Page', js: true do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
        uid: '123545', info: { email: 'test@example.com' })
  end

  it 'list payments' do
    visit root_path

    click_on 'Login with Github'
  end
end
