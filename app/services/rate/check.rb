# frozen_string_literal: true

class CheckRequestError < StandardError; end

class Rate::Check < BaseService
  BASE_URL = Rails.configuration.x.checker.base_url
  RATE_VALUE_PATH = %w[Valute USD Value].freeze

  def call
    res = JSON.parse(request).dig(*RATE_VALUE_PATH)
    Rails.logger.info("USD/RUB rate: #{res}")
    rate = Rate.create(value: res, until_time: Time.current)
    ActionCable.server.broadcast 'rate_channel', content: rate
  end

  private

  def request
    response = Faraday.get(BASE_URL)
    body = response.body
    raise CheckRequestError, body unless response.success?

    body
  end
end
