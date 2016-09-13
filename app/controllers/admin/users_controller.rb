class Admin::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def promote
    @user.is_admin = true
    @user.save
    flash [:notice] = "已将该用户提升为付费会员"
    redirect_to :back
  end
  
end
