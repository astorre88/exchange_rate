# frozen_string_literal: true

class Api::V1::RatesController < ApplicationController
  def show
    render json: Rate.last
  end
end
