class SessionsController < ApplicationController
  include SessionsHelper
  def new

  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = 'Invalid email/password combination.'
      render 'new'
    else
      sign_in(user)
      #This is where you want the user to be redirected too after a successful logon
      redirect_to user
    end
  end

  def destroy
  end

end
