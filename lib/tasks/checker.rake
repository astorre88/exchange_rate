# frozen_string_literal: true

namespace :rate do
  desc 'Rate check task'
  task check: :environment do
    Rails.logger = Logger.new(STDOUT)
    # Process.daemon(true, true)
    # File.open("#{Rails.root}/tmp/pids/rate_check.pid", 'w') { |f| f << Process.pid }
    # Signal.trap('TERM') { abort }

    loop do
      res = Rate::Check.call
      Rails.logger.info("USD/RUB rate: #{res}")
      Rate.create(value: res, until_time: Time.current)
      sleep 1.hour
    end
  end
end
