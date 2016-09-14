class Admin::UsersController < ApplicationController
  layout "admin"

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      if @user.user_name.blank?
        flash[:alert] = "用户名不能为空"
        render :edit
        return
      end
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def promote
    @user.is_paid = true
    @user.save
    flash[:notice] = "已将该用户提升为付费会员"
    redirect_to :back
  end

  def demote
    @user.is_paid = false
    @user.save
    flash[:notice] = "已将该用户设为非付费会员"
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end
end
