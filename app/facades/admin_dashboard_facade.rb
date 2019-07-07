# frozen_string_literal: true

# poro for admin dashboard
class AdminDashboardFacade
  def tutorials
    Tutorial.all
  end
end
