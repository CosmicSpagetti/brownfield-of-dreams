# frozen_string_literal: true

# This class is for defining the attributes from json repo
class Follower
  attr_reader :name,
              :url

  def initialize(follower)
    @name = follower[:login]
    @url = follower[:html_url]
  end

  def registered_user? 
    User.exists?(username: self.name)
  end

  def not_friend?(user)
    users = user.friend_users.map(&:username)
    users.include?(self.name)
  end
end
