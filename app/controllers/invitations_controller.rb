# frozen_string_literal: true

# class for invitations controller
class InvitationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @invitee = params[:username]
    email_address = grab_service_data[:email]
    if email_address.nil?
<<<<<<< HEAD
      flash[:error] = "The github user you selected doesn't have an email adddress associated with their github account"
=======
      flash[:error] = "The github user you selected doesn't have an email
      adddress associated with their github account"
>>>>>>> b1ee136dd2272d54b87207ced18b4a4316ba4dc6
    else
      InvitationMailer.invite(email_address, @invitee, current_user).deliver_now
      flash[:success] = 'Successfully sent invite!'
    end
    redirect_to dashboard_path
<<<<<<< HEAD
=======
  end

  private

  def grab_service_data
    @grab_service_data ||= GithubService.new(current_user)
                                        .invitee_email(params[:username])
>>>>>>> b1ee136dd2272d54b87207ced18b4a4316ba4dc6
  end
end
