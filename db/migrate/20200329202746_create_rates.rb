# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.decimal :value, null: false
      t.datetime :until_time, null: false

      t.timestamps
    end
  end
end
