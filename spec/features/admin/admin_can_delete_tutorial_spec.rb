require 'rails_helper'

describe 'an admin can' do
  it 'destroy a tutorial and videos with the tutorial' do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id)
    video2 = create(:video, tutorial_id: tutorial.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Destroy"

    expect(page).to_not have_content(tutorial.title)
    expect(Video.exists?(video1.id)).to eq(false)
    expect(Video.exists?(video2.id)).to eq(false)
  end
end