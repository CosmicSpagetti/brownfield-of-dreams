# frozen_string_literal: true

module Github
  class SessionsController < ApplicationController
    def update
      login = request.env['omniauth.auth']['extra']['raw_info']['login']
      token = request.env['omniauth.auth']['credentials']['token']
      user = current_user
      user.update(username: login)
      user.update(github_token: token)
      user.save
      session[:user_id] = user.id
      redirect_back fallback_location: dashboard_path
    end
  end
end
