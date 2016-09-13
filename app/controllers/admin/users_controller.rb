class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def promote
    @user.is_paid = true
    @user.save
    flash[:notice] = "已将该用户提升为付费会员"
    redirect_to :back
  end

  def deomote
    @user.is_paid = false
    @user.save
    flash[:notice] = "已将该用户设为非付费会员"
    redirect_to :back
  end
end
