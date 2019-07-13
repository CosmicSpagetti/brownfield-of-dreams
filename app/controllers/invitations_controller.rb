# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @invitee = params[:username]
    @user = current_user
    service = GithubService.new(@user).invitee_email(params[:username])
    email_address = service[:email]
    if email_address.nil?
      flash[:error] = "The github user you selected doesn't have an email adddress associated with their github account"
    else
      InvitationMailer.invite(email_address, @invitee, @user).deliver_now
      flash[:success] = 'Successfully sent invite!'
    end
    redirect_to dashboard_path
  end
end
