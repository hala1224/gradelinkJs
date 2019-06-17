class UsersController < ApplicationController

  #loading signup form
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    if @user.save
      #log in the users
      session[:user_id] = @user.id
      # fix the redirect later
      redirect_to courses_path

    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
