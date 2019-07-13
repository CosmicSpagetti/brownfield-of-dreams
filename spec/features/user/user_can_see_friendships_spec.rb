# frozen_string_literal: true

require 'rails_helper'

describe 'Logged in user', :js do
  it "can add friendships" do 
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
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_billy)

    visit dashboard_path

    within '.friends_section' do 
      expect(page).to have_content('Friends')
    end

    within "#followers_username-#{user_earl.username}" do 
      expect(page).to have_link(user_earl.username)
      expect(page).to have_link("Add as Friend")
    end

    within "#followers_username-kylecornelissen" do 
      expect(page).to_not have_link("Add as Friend")
    end

    within "#following_username-#{user_earl.username}" do 
      expect(page).to have_link(user_earl.username)
      expect(page).to have_link("Add as Friend")
      click_on "Add as Friend"
    end
    
    within '.friends_section' do 
      expect(page).to have_content(user_earl.username) 
    end
    
    within "#following_username-#{user_earl.username}" do 
      expect(page).to_not have_link("Add as Friend")
    end

  end
end