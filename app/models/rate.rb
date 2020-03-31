# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, :until_time, presence: true
  validate :until_time_after_now

  def self.last_manual
    where(manual: true).last
  end

  def self.last_auto
    where(manual: false).last
  end

  private

  def until_time_after_now
    return unless manual?
    return if until_time.blank?
    return if until_time > Time.current

    errors.add(:until_time, 'must be after the current time')
  end
end
