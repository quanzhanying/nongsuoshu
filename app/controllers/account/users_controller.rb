class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_geetest, only: [:send_verification_code]
  # before_action :phone_number_validates, only: [:verify_phone_number]
  # before_action :phone_number_validates_new, only: [:verify_phone_number_new]
  layout "user"

  def index
    @user = current_user
  end
end
