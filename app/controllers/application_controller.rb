class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: [:specific_page]

    def specific_page
        # Your specific page logic here
    end

    def after_sign_in_path_for(resource)
        # dashboard_path # Replace with the desired path
    end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
