class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end
end