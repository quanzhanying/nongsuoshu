class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_breadcrumbs

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to("Home", "/")]
  end

  def drop_breadcrumb(title = nil, url = nil)
    title ||= @page_title

    if title && url
      @breadcrumbs.push(view_context.link_to(title, url))
    elsif title
      @breadcrumbs.push(title)
    end
  end

  helper_method :resource, :resource_name, :devise_mapping

  def resource_name
    :user
   end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
