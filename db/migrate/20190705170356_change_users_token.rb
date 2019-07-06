# frozen_string_literal: true

# migration to remove the github oauth token from users
class ChangeUsersToken < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :github_oauth_token
  end
end
