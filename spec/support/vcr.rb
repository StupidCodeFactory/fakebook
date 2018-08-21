VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
  c.filter_sensitive_data('api_token') do |interaction|
    interaction.request.headers['Authorization']&.first
  end
end
