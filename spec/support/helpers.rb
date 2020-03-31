# frozen_string_literal: true

module Helpers
  def json_erb_fixture(filename, options = {})
    data = File.read(Rails.root.join("spec/fixtures/json/#{filename}"))
    JSON.parse(ERB.new(data).result(ErbBinding.new(options).get_binding))
  end
end
