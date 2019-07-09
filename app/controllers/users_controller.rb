# frozen_string_literal: true

# controller for users
class UsersController < ApplicationController
  def show
    render locals: {
      facade: GithubFacade.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.first_name}."
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    friend = User.find_by(username: params[:friend_username])
    user.shake_hand(friend)
    current_user.reload
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
