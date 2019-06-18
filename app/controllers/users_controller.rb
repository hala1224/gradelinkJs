
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
      # redirect_to courses_path
      c=[]
      Course.all.each do |course|
        if course.user_id == session[:user_id]
          c.push(course)
          byebug
        end
      end
      @courses = c


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
