class AddUserToSensors < ActiveRecord::Migration[5.1]
  def change
    add_reference :sensors, :user, foreign_key: true
  end
end
