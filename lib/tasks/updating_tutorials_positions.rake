namespace :update_tutorial_videos do
  desc 'update nils from video position'
  task videos: :environment do
    Video.all.each do |video|
      if video.position.nil?
        position = Video.order(position: :desc).first.position + 1
        video.update(position: position)
      end
    end
    p 'All Video Postions Updated'
  end
end