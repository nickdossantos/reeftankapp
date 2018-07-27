class SensorsController < ApplicationController

  def index
    @sensors = Sensor.all
  end

  def new
    @sensor= Sensor.new
  end

  def create
    @sensor = Sensor.new(sensor_params)
    # NOTE Assumes user is logged in
    @sensor.user_id = current_user.id
    puts "Apples and User ID #{@sensor.user_id}"
    if @sensor.save
      redirect_to sensors_path
      flash[:notice] = "Your sensor was saved"
    else
      render 'new'
    end
  end

  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy
    redirect_to sensors_path
  end
  private
  def sensor_params
    params.require(:sensor).permit(:name, :user_id)
  end
end
