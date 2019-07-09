# frozen_string_literal: true

# class for application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'mike@turing.io'
  layout 'mailer'

end
