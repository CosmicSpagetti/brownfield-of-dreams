# frozen_string_literal: true

# application controller class
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def four_oh_four
    raise ActionController::RoutingError, 'Not Found'
  end
end
