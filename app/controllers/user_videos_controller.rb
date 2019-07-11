# frozen_string_literal: true

# controller for user videos
class UserVideosController < ApplicationController
  def new; end

  def create
    user_video = UserVideo.new(user_video_params)
    if current_user.user_videos.find_by(video_id: user_video.video_id)
      flash[:error] = 'Already in your bookmarks'
    elsif user_video.save
      flash[:success] = 'Bookmark added to your dashboard!'
    end
    current_vid = Video.find(user_video_params[:video_id])
    current_tutorial = current_vid.tutorial
    redirect_to tutorial_path(current_tutorial)
  end

  private

  def user_video_params
    params.permit(:user_id, :video_id)
  end
end
