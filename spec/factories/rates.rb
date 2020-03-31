# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    value { 30 }
    until_time { Time.current + 1.hour }
    manual { true }
  end
end
