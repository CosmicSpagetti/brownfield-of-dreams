# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password) }
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name: 'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name: 'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end
  describe 'Instance methods' do
    it '.shake_hand' do
      user_billy = User.create!(email: 'billy@example.com',
                             first_name: 'Billy',
                             last_name: 'Urrutia',
                             password: 'password',
                             username: 'CosmicSpagetti',
                             github_token: ENV['BILLY_GITHUB_TOKEN'])
      user_earl = User.create!(email: 'earl@example.com',
                            first_name: 'Earl',
                            last_name: 'Stephens',
                            password: 'password',
                            username: 'earl-stephens',
                            github_token: ENV['EARL_GITHUB_TOKEN'])

      user_billy.shake_hand(user_earl)
      user_billy.reload
      expect(user_billy.friend_users).to include(user_earl)
    end

    it '.grab_videos' do
      user = create(:user)
      tutorial1 = create(:tutorial, title: 'How to Tie Your Shoes')
      tutorial2 = create(:tutorial, title: 'How to Brush Your Teeth')
      video1 = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial1, position: 1)
      video2 = create(:video, title: 'Right Over Left', tutorial: tutorial1, position: 2)
      video3 = create(:video, title: 'Use Velcro', tutorial: tutorial1, position: 3)
      video4 = create(:video, title: 'Electric Toothbrush', tutorial: tutorial2, position: 1)
      uv1 = UserVideo.create!(user_id: user.id, video_id: video1.id)
      uv2 = UserVideo.create!(user_id: user.id, video_id: video2.id)
      uv3 = UserVideo.create!(user_id: user.id, video_id: video3.id)
      uv4 = UserVideo.create!(user_id: user.id, video_id: video4.id)

      video_data = user.grab_videos

      expect(video_data[0]).to be_an_instance_of Video
      expect(video_data[2].position).to eq(2)
    end

    it '.grab_tutorial_names' do
      user = create(:user)
      tutorial1 = create(:tutorial, title: 'How to Tie Your Shoes')
      tutorial2 = create(:tutorial, title: 'How to Brush Your Teeth')
      video1 = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial1, position: 1)
      video2 = create(:video, title: 'Right Over Left', tutorial: tutorial1, position: 2)
      video3 = create(:video, title: 'Use Velcro', tutorial: tutorial1, position: 3)
      video4 = create(:video, title: 'Electric Toothbrush', tutorial: tutorial2, position: 1)
      uv1 = UserVideo.create!(user_id: user.id, video_id: video1.id)
      uv2 = UserVideo.create!(user_id: user.id, video_id: video2.id)
      uv3 = UserVideo.create!(user_id: user.id, video_id: video3.id)
      uv4 = UserVideo.create!(user_id: user.id, video_id: video4.id)

      tutorial_data = user.grab_tutorial_names

      expect(tutorial_data[0]).to eq('How to Tie Your Shoes')
      expect(tutorial_data[1]).to eq('How to Brush Your Teeth')
    end

    it '.update_activation_status' do
      user_earl = User.create!(email: 'earl@example.com',
                            first_name: 'Earl',
                            last_name: 'Stephens',
                            password: 'password',
                            username: 'earl-stephens',
                            github_token: ENV['EARL_GITHUB_TOKEN'],
                            email_active: false)

      user_earl.update_activation_status

      expect(user_earl.email_active).to eq(true)
    end
  end
end
