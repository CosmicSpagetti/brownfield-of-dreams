# frozen_string_literal: true

# migration for creating friendships
class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend_user
    end
  end
end
