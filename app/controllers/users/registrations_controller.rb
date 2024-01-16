
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_minimum_password_length
  before_action :configure_sign_up_params, only: [:create]

 # allowing first_name and last_name in params for sign up
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
 
  # create method for signup
  def create
    super do |resource|
      if resource.persisted?
        UserMailer.acknowledgment_email(resource).deliver_now
      end
    end
  end

  private
  # Sets minimum password length as 6
  def set_minimum_password_length
    if devise_mapping && devise_mapping.validatable?
      @minimum_password_length = resource_class.password_length.min
    end
  end
end
