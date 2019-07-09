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
    self.friend_users << user
  end

  def update_activation_status
    self.update(email_active: true)
  end
end
