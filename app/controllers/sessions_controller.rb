class SessionsController < ApplicationController

  def new
    @tours = Tour.all
    @shuttles = Shuttle.all
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in sucessfully.'
      redirect_to agm_admin_path
    else
      flash[:error] = 'Login failed. Please try again.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out.'
    redirect_to root_path
  end
end


