class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_geetest, only: [:send_verification_code]
  # before_action :phone_number_validates, only: [:verify_phone_number]
  # before_action :phone_number_validates_new, only: [:verify_phone_number_new]
  layout "user"

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to account_users_path
    else
      render :edit
    end
  end


  def change_password
    @user = current_user
  end


private

  def user_params
    params.require(:user).permit(:email)
  end
end
