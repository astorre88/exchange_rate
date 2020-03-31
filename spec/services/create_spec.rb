# frozen_string_literal: true

require 'rails_helper'

describe Rate::Create do
  let(:rate) { 34.1234 }
  let(:date) { '2020-03-31' }
  let(:time) { '13:51:50' }
  let(:manual) { true }

  subject { described_class.call(rate: rate, date: date, time: time, manual: manual) }

  context 'when date is in the future' do
    let(:date) { (Time.current + 1.day).to_date.to_s }

    it 'creates a record in DB' do
      expect { subject }.to change(Rate, :count).from(0).to(1)
    end

    it 'parses properly date and time' do
      expect(subject.until_time).to eq(Time.zone.parse("#{date} 13:51:50"))
    end
  end

  context 'when date is in the past' do
    it 'does not create a record in DB' do
      expect { subject }.not_to change(Rate, :count)
    end
  end
end
