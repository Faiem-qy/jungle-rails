class SessionsController < ApplicationController
  def new
    render 'sessions/login'
  end

  def create
    # user = User.find_by(email: params[:session][:email])
    user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
    if user
      # Successful login
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful!'
    else
      # Failed login
      redirect_to '/login',notice: 'Login Unscuccessful!'
    end
  end

  def destroy
    session[:user_id] = nil
    puts "This is the HERE: #{session[:user_id]}"
    redirect_to '/login', notice: 'Logout successful!'
  end
end
