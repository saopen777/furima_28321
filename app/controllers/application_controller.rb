class ApplicationController < ActionController::Base
  before_action :authenticate_with_http_digest
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def edit
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end



end
