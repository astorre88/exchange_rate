# frozen_string_literal: true

class Api::V1::RatesController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    render json: Rate::Choose.call
  end

  def show_admin
    render json: Rate.where(manual: true).last
  end

  def create
    rate = Rate::Create.call(rate_params.to_h.update(manual: true))
    if rate.invalid?
      return render(json: { errors: rate.errors.full_messages }, status: :bad_request)
    end

    ActionCable.server.broadcast 'rate_channel', content: rate

    render json: rate
  end

  private

  def rate_params
    params.permit(:rate, :date, :time, :format)
  end
end
