class UsersController < ApplicationController


  #loading the signup form
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
      if @user.save
        #login the user
        session[:user_id] = @user.id
        redirect_to users_path(@user)
      else
        render :new
      end
  end

  def index
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
