class SensorValuesController < ApplicationController
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

  def set_article
    @sensor_value = SensorValue.find(params[:id])
  end

  def sensor_value_params
    params.require(:sensor_value).permit(:value, :sensor_id)
  end
end
