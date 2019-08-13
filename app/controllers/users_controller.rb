
class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log in the users
      session[:user_id] = @user.id
      redirect_to user_path(@user)

    else
      render :new
    end
  end

  def show
   @user = User.find_by_id(params[:id])
   # respond_to do |f|
          redirect_to '/' if !@user
    # f.json {render json: @user}
  
  end

  def most_popular
   @teacher = User.most_popular
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end
end
