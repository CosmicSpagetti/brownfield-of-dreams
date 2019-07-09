# frozen_string_literal: true

# activation controller
class ActivationController < ApplicationController

  def index
    user = User.find_by(email: params[:email])
    user.update_activation_status
  end

end
