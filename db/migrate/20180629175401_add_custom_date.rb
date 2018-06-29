class AddCustomDate < ActiveRecord::Migration[5.1]
  def change
    add_column :sensor_values, :date, :datetime
  end
end
