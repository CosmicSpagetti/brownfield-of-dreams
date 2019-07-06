require "rails_helper"

describe 'an admin can' do
  it 'create a tutorial' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(admin)

    visit new_admin_tutorial_path

    fill_in "Title", with: "Mod 0"
    fill_in "Description", with: "Prework"

    click_on 'Save'
    latest = Tutorial.last

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Mod 0")

    click_on "Mod 0"

    expect(current_path).to eq(tutorial_path(latest.id))
    expect(page).to have_content("There are no videos for this tutorial yet.")
  end
end
