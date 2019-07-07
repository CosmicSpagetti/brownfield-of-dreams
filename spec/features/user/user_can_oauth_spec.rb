# frozen_string_literal: true

require 'rails_helper'

describe 'Logged in user' do
  it 'can see github repos' do
    stub_omniauth

    #     As a user
    # When I visit /dashboard
    # Then I should see a link that is styled like a button that says "Connect to Github"
    # And when I click on "Connect to Github"
    # Then I should go through the OAuth process
    # And I should be redirected to /dashboard
    # And I should see all of the content from the previous Github stories (repos, followers, and following)
    user = create(:user)
    visit '/'

    click_on 'Sign In'

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    click_on 'Connect to Github'
    user.reload

    expect(user.username).to eq('earl-stephens')
    expect(user.github_token).to eq(ENV['EARL_GITHUB_TOKEN'])
    within '.Github_section' do
      expect(page).to have_content('Github')
      expect(page.all('li').count).to eq(5)
    end
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    'extra' => { 'raw_info' => { 'login' => 'earl-stephens' } },
    'credentials' => { 'token' => ENV['EARL_GITHUB_TOKEN'] }
  )
end
