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
    rate = Rate.create(value: rate_params[:rate], until_time: "#{rate_params[:date]}T#{rate_params[:time]}", manual: true)
    render json: rate
  end

  private

  def rate_params
    params.permit(:rate, :date, :time, :format)
  end
end
