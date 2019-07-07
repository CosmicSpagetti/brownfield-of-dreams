# frozen_string_literal: true

# migration to add columns to the users table
class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :github_token, :text
  end
end
