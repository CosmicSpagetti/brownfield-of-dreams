# frozen_string_literal: true

require 'rails_helper'

describe 'an admin can' do
  it 'create a tutorial' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(admin)

    visit new_admin_tutorial_path

    fill_in 'Title', with: 'Mod 0'
    fill_in 'Description', with: 'Prework'
    fill_in 'Thumbnail',
      with: 'https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg'

    click_on 'Save'
    latest = Tutorial.last

    expect(current_path).to eq(tutorial_path(latest.id))
    expect(page).to have_content('There are no videos for this tutorial yet.')
    expect(page).to have_content('Successfully created tutorial.')
  end
  
  it 'create a tutorial sad path' do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(admin)

    visit new_admin_tutorial_path
    click_on 'Save'
    latest = Tutorial.last

    expect(current_path).to eq(new_admin_tutorial_path)
  end
end
