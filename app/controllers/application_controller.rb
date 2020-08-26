class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  before_action :basic_auth
  before_action :authenticate_with_http_digest
  before_action :configure_permitted_parameters, if: :devise_controller?


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end



#  def new
#    @user = User.new
#  end
 
#  def create
#    @user = User.new(donation_params)
#  end
 
#   private
 
#  def donation_params
#    params.require(:user).permit(:nickname, :email, :password, :family_name, :firstname, :family_name_kana, :first_name_kana, :birth_day)
#  end

end
