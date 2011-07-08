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
end
