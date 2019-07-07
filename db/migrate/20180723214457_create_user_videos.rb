# frozen_string_literal: true

# migration to create the user videos table
class CreateUserVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_videos do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true
      t.timestamps
    end
  end
end
