class AddManualToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :manual, :boolean, default: false
  end
end
