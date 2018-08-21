class CoolPay

  APIError = Class.new(StandardError)

  API_KEY_HEADER     = 'Authorization'.freeze
  CONTEN_TYPE_HEADER = 'Content-Type'.freeze

  RECIPIENTS_URL = '/api/recipients'.freeze
  LOGIN_URL      = '/api/login'.freeze
  PAYMENTS_URL   = '/api/payments'.freeze

  def create_recipient(attributes)
    response = post_response(RECIPIENTS_URL, body: attributes)
    response['recipient']
  end

  def fetch_recipients
    get_response(RECIPIENTS_URL)['recipients']
  end

  def create_payment(attributes)
    response = post_response(PAYMENTS_URL, body: attributes)
    response['payment']
  end

  def fetch_payments
    get_response(PAYMENTS_URL)['payments']
  end

  private

  def connection
    @connection ||= Faraday.new(url: config.api_endoint)
  end

  def get_response(url, params: {})
    response = connection.get do |req|
      req.url url
      req.headers[CONTEN_TYPE_HEADER] = 'application/json'
      req.headers[API_KEY_HEADER] = "Bearer #{auth_token}"
      req.params = params
    end
    handle_response(response)
  end

  def post_response(url, params: {}, body: {}, login: true)
    response = connection.post do |req|
      req.url url
      req.headers[CONTEN_TYPE_HEADER] = 'application/json'
      req.headers[API_KEY_HEADER] = "Bearer #{auth_token}" if login
      req.params = params
      req.body = body.to_json
    end

    handle_response(response)
  end

  def handle_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      raise APIError, response.body
    end
  end

  def auth_token
    post_response(
      LOGIN_URL,
      body: { username: config.api_username, apikey:  config.api_key},
      login: false)['token']
  end

  def config
    Rails.configuration.x.coolpay
  end
end
