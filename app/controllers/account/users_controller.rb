class Account::UsersController < ApplicationController
  before_action :authenticate_user!
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
    params.require(:user).permit(:user_name, :email)
  end
end
