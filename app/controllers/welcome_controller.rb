class WelcomeController < ApplicationController
  def index
    @sensor_value = SensorValue.order("created_at").last
  end

  def documentation

  end
end
