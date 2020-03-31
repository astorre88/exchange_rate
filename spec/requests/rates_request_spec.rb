# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/rate', type: :request do
  before do
    create(:rate)
    get '/api/v1/rate.json'
  end

  it 'returns 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns json' do
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end

  it 'returns actual rate record' do
    expect(JSON.parse(response.body)['value']).to eq('30.0')
  end
end

RSpec.describe 'POST /api/v1/rate', type: :request do
  let(:date) { '2020-03-31' }
  let(:params) do
    {
      rate: 17,
      date: date,
      time: '13:51:50'
    }
  end

  before do
    post '/api/v1/rate.json', params: params
  end

  context 'when date is wrong' do
    it 'returns 400' do
      expect(response).to have_http_status(400)
    end

    it 'returns an error' do
      expect(JSON.parse(response.body)).to eq({ 'errors' => ['Until time must be after the current time'] })
    end
  end

  context 'when date is valid' do
    let(:date) { (Time.current + 1.day).to_date.to_s }

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns actual rate record' do
      expect(JSON.parse(response.body)['value']).to eq('17.0')
    end
  end
end
