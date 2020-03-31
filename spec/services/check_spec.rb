# frozen_string_literal: true

require 'rails_helper'

describe Rate::Check do
  subject { described_class.call }

  before do
    stub_request(:get, Rails.configuration.x.checker.base_url)
      .to_return(body: json_erb_fixture('rate_api.json.erb', rate: 64.1234).to_json)
  end

  it 'creates a record in DB' do
    expect { subject }.to change(Rate, :count).from(0).to(1)
  end

  it 'properly parses rate API response' do
    subject
    expect(Rate.take.value).to eq(64.1234)
  end
end
