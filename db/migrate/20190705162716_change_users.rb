# frozen_string_literal: true

# migration to add a column to the users table
class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_oauth_token, :text
  end
end
