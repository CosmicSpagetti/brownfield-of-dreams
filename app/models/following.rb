# frozen_string_literal: true

# This class is for defining the attributes from json repo
class Following
  attr_reader :name,
              :url

  def initialize(following)
    @name = following[:login]
    @url = following[:html_url]
  end

  def registered_user? 
    User.exists?(username: self.name)
  end

  def not_friend?(user)
    users = user.friend_users.map(&:username)
    users.include?(self.name)
  end
end
