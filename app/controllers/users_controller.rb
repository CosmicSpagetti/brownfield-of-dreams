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
    user = User.new(user_params)
    if user.save
      log_in_and_email(user)
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.join(' ')
      redirect_to new_user_path(user)
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

  def log_in_and_email(user)
    session[:user_id] = user.id
    flash[:success] = "Logged in as #{user.first_name}."
    EmailActivationMailer.activate(user).deliver_now
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
