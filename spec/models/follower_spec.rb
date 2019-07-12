# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follower do
  describe "Attributes" do 
    it "should display attributes" do 
      follower_hash = {login: "Billy", html_url: "blah.com"}
      whos_follower = Follower.new(follower_hash)

      expect(whos_follower.name).to eq("Billy")
      expect(whos_follower.url).to eq("blah.com")
    end
  end 

  describe "instance methods" do 
    it ".registered_user?" do 
      follower_hash = {login: "Billy", html_url: "blah.com"}
      whos_follower = Follower.new(follower_hash)

      expect(whos_follower.registered_user?).to eq(false)
      create(:user, username: "Billy")
      expect(whos_follower.registered_user?).to eq(true)
    end

    it ".not_friend?" do 
      follower_hash = {login: "Billy", html_url: "blah.com"}
      whos_follower = Follower.new(follower_hash) 
      user = create(:user)
      
      expect(whos_follower.not_friend?(user)).to eq(false)
    end
  end
end