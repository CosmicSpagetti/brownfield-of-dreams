# frozen_string_literal: true

# migration to add tutorials foreign key to videos
class AddTutorialsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :tutorial, index: true
  end
end
