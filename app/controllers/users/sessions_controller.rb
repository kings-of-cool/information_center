class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    information_centers_url
  end
end
