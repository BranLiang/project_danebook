class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    newsfeed_path(current_user)
  end
end