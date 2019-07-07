# frozen_string_literal: true

# migration to add position column to videos table
class AddPositionToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :position, :integer, default: 0
  end
end
