# frozen_string_literal: true

require 'rails_helper'

describe Rate::Choose do
  subject { described_class.call }

  it "returns nil when there's no any rates" do
    expect(subject).to eq(nil)
  end

  it 'returns actual manual rate' do
    create(:rate, until_time: Time.current + 1.hour, manual: true)

    expect(subject.value).to eq(30)
  end

  it "returns nil when there's no any actual rate" do
    create(:rate, until_time: Time.current + 1.hour, manual: true)
    Timecop.travel(2.hours)

    expect(subject).to eq(nil)
  end

  it 'returns actual auto rate' do
    create(:rate, until_time: Time.current + 1.hour, manual: true)
    create(:rate, value: 77, until_time: Time.current + 2.hours, manual: false)
    Timecop.travel(3.hours)

    expect(subject.value).to eq(77)
  end
end
