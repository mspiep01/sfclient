class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #DEFINITELY not the right way to do it, want to restrict access to only sign-in/main page unless signed in
  before_action :signed_in_user, except: [:home,:new, :create]
  
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
  
  include SessionsHelper
end
