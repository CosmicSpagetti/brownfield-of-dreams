# frozen_string_literal: true

# controller for admin dashboard
module Admin
  class DashboardController < Admin::BaseController
    def show
      @facade = AdminDashboardFacade.new
    end
  end
end
