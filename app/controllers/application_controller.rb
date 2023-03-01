class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if staff_signed_in?
      admin_welcome_index_path
    elsif user_signed_in?
      welcome_index_path
    end
  end
end
