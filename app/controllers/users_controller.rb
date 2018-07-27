class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucess] = "Welcome to the ReefTank App #{@user.username}"
      redirect_to sensor_values_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]= "Your edit has been saved"
      redirect_to sensor_values_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(parasm[:id])

  end

  def graphs
    render 'graphs'
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
