# frozen_string_literal: true

# migration to add another column to users
class AddAnotherColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_active, :boolean, default: false
  end
end
