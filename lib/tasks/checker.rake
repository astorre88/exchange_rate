# frozen_string_literal: true

namespace :rate do
  desc 'Rate check task'
  task check: :environment do
    Rails.logger = Logger.new(STDOUT)
    TIME_STEP = 1.minute # hour
    # Process.daemon(true, true)
    # File.open("#{Rails.root}/tmp/pids/rate_check.pid", 'w') { |f| f << Process.pid }
    # Signal.trap('TERM') { abort }

    loop do
      if Rate.where(manual: true).last.until_time < Time.current
        rate = Rate::Check.call
        ActionCable.server.broadcast 'rate_channel', content: rate
      end
      sleep TIME_STEP
    end
  end
end
