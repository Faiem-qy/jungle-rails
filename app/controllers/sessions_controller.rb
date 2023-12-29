class SessionsController < ApplicationController
  def new
    render 'sessions/login'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Successful login
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful!'
    else
      # Failed login
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logout successful!'
  end
end
