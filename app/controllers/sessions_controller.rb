class SessionsController < ApplicationController

# skip_before_action :verify_authenticity_token


  def new
    # can take out @user = User.new & in sessions/new.html.erb change form_for(:user)
    @user = User.new
    render :login
  end

  def create
    if params[:provider] == 'google_oauth2'
        @user = User.create_by_google_omniauth(auth)
        @user[:email]=@user[:username]
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)

      elsif params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
     else


         @user = User.find_by(username: params[:user][:username])

          # if @user && @user.authenticate(params[:user][:password])
            # or @user.try(.authenticate(params[:user][:password])
         if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id

            # redirect_to courses_path * changed to user_path
            redirect_to courses_path(@user)
          else
            flash[:error] = "Sorry, your username or password was incorrect"
            redirect_to '/login'
          end
      end
  end


  def omniauth
      @user = User.create_by_google_omniauth(auth)
      session[:user_id] = @user.id
     redirect_to user_path(@user)
  end


  def index
  end

  def home
  end

  def destroy
    session.clear
    redirect_to '/'
  end

      private

      def auth
        request.env['omniauth.auth']
      end

end
