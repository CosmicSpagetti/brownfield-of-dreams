require 'rails_helper'

describe 'Logged in user' do
  it 'can see github repos' do

#     As a user
# When I visit /dashboard
# Then I should see a link that is styled like a button that says "Connect to Github"
# And when I click on "Connect to Github"
# Then I should go through the OAuth process
# And I should be redirected to /dashboard
# And I should see all of the content from the previous Github stories (repos, followers, and following)
    user = create(:user, username: 'CosmicSpagetti')

    visit '/'

    click_on 'Sign In'

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    click_on 'Connect to Github'

    within '.Github_section' do
      expect(page).to have_content('Github')
      expect(page.all('li').count).to eq(5)
    end
  end
end
