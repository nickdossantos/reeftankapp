class SensorValuesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only:[:edit, :update, :show, :destroy]

  def index
    @sensor_values = SensorValue.all
  end

  def new
    @sensor_value = SensorValue.new
  end

  def create
    @sensor_value = SensorValue.new(sensor_value_params)
    if @sensor_value.save
      flash[:notice] = "Your article was saved"
      redirect_to sensor_values_path
    else
      render 'new'
    end
  end

  def destroy
    @sensor_value = SensorValue.find(params[:id])
    @sensor_value.destroy
    redirect_to sensor_values_path
  end

  def create_reading
    @sensor_value = SensorValue.new
    @sensor_value.sensor_id = params[:sensor_id]
    @sensor_value.value = params[:value]
    if @sensor_value.save
      flash[:notice] = "Your article was saved"
      render json: {status: 'Sucess!', message: 'Loaded Things'}
    else
      render json: {status: 'FAIL!', message: 'Loaded Things'}
    end
    puts @sensor_value.errors.full_messages
    puts params[:sensor_id]
    puts params[:value]
  end

  def set_article
    @sensor_value = SensorValue.find(params[:id])
  end

  def sensor_value_params
    params.require(:sensor_value).permit(:value, :sensor_id, :date)
  end
end
