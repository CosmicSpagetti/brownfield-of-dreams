# frozen_string_literal: true

# user model class
class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_many :friendships
  has_many :friend_users, through: :friendships

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  enum role: %i[default admin]
  has_secure_password

  def shake_hand(user)
    friend_users << user
  end

  def update_activation_status
    update(email_active: true)
  end

  def grab_tutorial_names
    tutorial_names = []
    grab_videos.each do |vid|
      tutorial_names << vid.tutorial.title
    end
    tutorial_names.uniq
  end

  def grab_videos
    Video.joins(:user_videos, :tutorial)
         .where(user_videos: { user_id: id })
         .includes(:tutorial)
         .order(:position)
  end
end
