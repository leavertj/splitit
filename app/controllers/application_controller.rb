class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :authorize

  protected

  def authorize
    unless (signed_in?)
      redirect_to sessions_new_path, :notice => "You need to log in to view this page"
    end
  end

  def authorize_admin
    unless (is_admin?)
      redirect_to sessions_new_path, :notice => "You do not have permission to view this page"
    end
  end
end
