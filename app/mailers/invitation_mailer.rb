class InvitationMailer < ApplicationMailer

  def invite(email, invitee, user)
    @invitee = invitee
    @user = user
    @email = email
    binding.pry
    mail(to: email, subject: "Invitation to join our app")
  end
end
