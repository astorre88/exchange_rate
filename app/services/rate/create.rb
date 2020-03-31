# frozen_string_literal: true

module Rate
  class Create < BaseService
    option :rate
    option :date
    option :time
    option :manual, default: proc { false }

    def call
      Rate.create(value: rate, until_time: "#{date}T#{time}", manual: manual)
    end
  end
end
