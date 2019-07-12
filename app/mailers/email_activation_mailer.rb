# frozen_string_literal: true

# this class has a method that sends an email to the user to verify
class EmailActivationMailer < ApplicationMailer
  def activate(user)
    @user = user
    mail(to: user.email, subject: 'Activate your account')
  end
end
