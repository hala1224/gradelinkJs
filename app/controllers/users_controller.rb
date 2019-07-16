
class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log in the users
      session[:user_id] = @user.id
      c=[]
      Course.all.each do |course|
        if course.user_id == session[:user_id]
          c.push(course)
        end
      end
      @courses = c
      byebug


      redirect_to user_path(@user)

    else
      render :new
    end
  end

  def show
   @user = User.find_by_id(params[:id])
   redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
