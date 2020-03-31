# frozen_string_literal: true

class Rate::Choose < BaseService
  def call
    actual_manual_rate = Rate.last_manual

    if actual_manual_rate.nil?
      Rate.last_auto
    elsif actual_manual_rate.until_time > Time.current
      actual_manual_rate
    else
      Rate.last_auto
    end
  end
end
