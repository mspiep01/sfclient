class SessionsController < ApplicationController
  skip_before_action :signed_in_user, only: [:new,:create]
  def new
  end
  
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Sign the user in and redirect to the user's show page.
        sign_in user
        #redirect_to accounts_path
        redirect_to account_path(id: user.accountid)
      else
        flash[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
  end
  
  def destroy
      sign_out
      redirect_to root_url
    end
end
