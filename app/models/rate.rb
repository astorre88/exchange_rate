# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, presence: true
  validates :until_time, presence: true
end
