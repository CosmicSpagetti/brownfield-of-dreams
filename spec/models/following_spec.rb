# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Following do
  describe "Attributes" do 
    it "should display attributes" do 
      following_hash = {login: "Billy", html_url: "blah.com"}
      whos_following = Following.new(following_hash)

      expect(whos_following.name).to eq("Billy")
      expect(whos_following.url).to eq("blah.com")
    end
  end 

  describe "instance methods" do 
    it ".registered_user?" do 
      following_hash = {login: "Billy", html_url: "blah.com"}
      whos_following = Following.new(following_hash)

      expect(whos_following.registered_user?).to eq(false)
      create(:user, username: "Billy")
      expect(whos_following.registered_user?).to eq(true)
    end

    it ".not_friend?" do 
      following_hash = {login: "Billy", html_url: "blah.com"}
      whos_following = Following.new(following_hash) 
      user = create(:user)
      
      expect(whos_following.not_friend?(user)).to eq(false)
    end
  end
end