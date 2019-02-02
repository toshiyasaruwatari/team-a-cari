class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def phone
  end

  def create
    User.create(identification_params)
    redirect_to :root
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def identify
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def identification_params
    params.require.permit(:fist_name, :last_name, :first_reading, :last_reading, :postal_code, :prefecture, :city, :building_name, :adress, :birth_day, :birth_month, :birth_year)
  end
end
