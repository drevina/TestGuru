class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    flash[:notice] = t('concerns.application.hello', user: user.full_name)
    user.admin? ? admin_tests_path : root_path
  end
  
  def default_url_options
    { lang: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                               keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
