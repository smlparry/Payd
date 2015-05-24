class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dash_home_path || root_path
  end

  def redirect_with_message(path, type, message)
    redirect_to path, flash: Hash[type, message]
  end

  def redirect_with_notice(path, message)
    redirect_with_message(path, 'notice', message)
  end

  def redirect_with_error(path, message)
    redirect_with_message(path, 'error', message)
  end
end
