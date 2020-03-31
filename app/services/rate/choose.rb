# frozen_string_literal: true

class Rate::Choose < BaseService
  def call
    actual_manual_rate = Rate.where(manual: true).last

    if actual_manual_rate.until_time > Time.current
      actual_manual_rate
    else
      Rate.where(manual: false).last
    end
  end
end
