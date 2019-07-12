# frozen_string_literal: true

# This class sends an email to whatever github handle you put in inviting them
# to the app
class InvitationMailer < ApplicationMailer
  def invite(email, invitee, user)
    @invitee = invitee
    @user = user
    @email = email
    mail(to: email, subject: 'Invitation to join our app')
  end
end
