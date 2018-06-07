class CreateSensorValues < ActiveRecord::Migration[5.1]
  def change
    create_table :sensor_values do |t|
      t.float :value
      t.references :sensor, foreign_key: true
      t.datetime :created_at

      t.timestamps
    end
  end
end
