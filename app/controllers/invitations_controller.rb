class InvitationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @invitee = params[:username]
    @user = current_user
    service = GithubService.new(@user).invitee_email(params[:username])
    email_address = service[:email]
    binding.pry
    InvitationMailer.invite(email_address, @invitee, @user).deliver_now
    flash[:success] = "Successfully sent invite!"
  end

end
