class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    # add custom create logic here
    super
  end

  def update

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)

    yield resource if block_given?

    if resource_updated
      if account_update_params[:password].blank?
        flash[:alert] = "请输入新密码"
        redirect_to change_password_account_user_path(resource)
        return
      else
        if is_flashing_format?
          flash_key =
            update_needs_confirmation?(resource, prev_unconfirmed_email) ?
                     :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        bypass_sign_in resource, scope: resource_name
        respond_with resource, location: after_update_path_for(resource)
      end
    else
      clean_up_passwords resource
      errors = resource.errors.messages
      puts "#{resource.errors.messages}"
      if errors[:current_password].present?
        flash[:alert] = errors[:current_password].first
        redirect_to change_password_account_user_path(resource)
        return
      elsif errors[:password].present?
        flash[:alert] = errors[:password].first
        redirect_to change_password_account_user_path(resource)
        return
      elsif errors[:password_confirmation].present?
        flash[:alert] = errors[:password_confirmation].first
        redirect_to change_password_account_user_path(resource)
        return
      end

      redirect_to change_password_account_user_path(resource)
    end

  end
end
