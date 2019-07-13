# frozen_string_literal: true

module Admin
  # controller for admin base
  class BaseController < ApplicationController
    before_action :require_admin!

    def require_admin!
<<<<<<< HEAD
        four_oh_four unless current_user.admin?
=======
      four_oh_four unless current_user.admin?
>>>>>>> b1ee136dd2272d54b87207ced18b4a4316ba4dc6
    end
  end
end
