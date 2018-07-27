class Sensor < ApplicationRecord
  has_many :sensor_values, dependent: :destroy
  validates :name, presence: true
  belongs_to :user
end
