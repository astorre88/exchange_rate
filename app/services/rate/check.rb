class CheckRequestError < StandardError; end

class Rate::Check < BaseService
  BASE_URL = Rails.configuration.x.checker.base_url
  RATE_VALUE_PATH = %w(Valute USD Value).freeze

  def call
    JSON.parse(request).dig(*RATE_VALUE_PATH)
  end

  private

  def request
    response = Faraday.get(BASE_URL)
    body = response.body
    raise CheckRequestError, body unless response.success?
    body
  end
end
