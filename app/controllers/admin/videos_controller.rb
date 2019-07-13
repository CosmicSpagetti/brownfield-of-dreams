# frozen_string_literal: true

module Admin
  # controller for admins video controls
  class VideosController < Admin::BaseController
    def edit
      @video = Video.find(params[:video_id])
    end

    def update
      video = Video.find(params[:id])
      video.update(video_params)
    end

    def create
      begin
        grab_video.save
        flash[:success] = 'Successfully created video.'
      rescue StandardError
        flash[:error] = video.errors.full_messages.join(' ')
      end
      redirect_to edit_admin_tutorial_path(id: grab_tutorial.id)
    end

    private

    def grab_video
      grab_tutorial.videos
                   .new(new_vid_params.merge(thumbnail: thumbnail))
    end

    def grab_tutorial
      @_grab_tutorial = Tutorial.find(params[:tutorial_id])
    end

    def thumbnail
      @_thumbnail = YouTube::Video.by_id(new_vid_params[:video_id]).thumbnail
    end

    def video_params
      params.permit(:position)
    end

    def new_vid_params
      params.require(:video).permit(:title, :description, :video_id, :thumbnail)
    end
  end
end
