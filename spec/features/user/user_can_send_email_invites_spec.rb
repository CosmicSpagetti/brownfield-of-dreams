require "rails_helper"

describe 'a logged in user' do
  it 'can send an email invitation' do
    user = create(:user,
                  username: 'CosmicSpagetti',
                  github_token: ENV['BILLY_GITHUB_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    within '.invite_section'do
      click_on 'Send an Invite'
    end
    expect(current_path).to eq('/invite')

    fill_in :username, with: 'cosmicspagetti'
    click_on 'Send Invite'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Successfully sent invite!")
  end

  it 'can tell you if invitee does not have email on github' do 
    user = create(:user,
                  username: 'CosmicSpagetti',
                  github_token: ENV['BILLY_GITHUB_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    within '.invite_section'do
      click_on 'Send an Invite'
    end
    expect(current_path).to eq('/invite')

    fill_in :username, with: 'billy'
    click_on 'Send Invite'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The github user you selected doesn't have an email adddress associated with their github account")
  end
end

