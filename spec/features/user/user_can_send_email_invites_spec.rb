require "rails_helper"

describe 'a logged in user' do
  it 'can send an email invitation' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    within '.invite_section'do
      click_on 'Send an Invite'
    end
    expect(current_path).to eq('/invite')

    fill_in :username, with: 'earl-stephens'
    click_on 'Send Invite'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Successfully sent invite!")
  end
end
