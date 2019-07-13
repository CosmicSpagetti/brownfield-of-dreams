# frozen_string_literal: true

module Github
  # class for sessions controller under Github namespace
  class SessionsController < ApplicationController
    def update
      user = current_user
      user.update(username: login)
      user.update(github_token: token)
      user.save
      session[:user_id] = user.id
      redirect_back fallback_location: dashboard_path
    end

    private

    def login
      @_login = request.env['omniauth.auth']['extra']['raw_info']['login']
    end

    def token
      @_token = request.env['omniauth.auth']['credentials']['token']
    end
  end
end
