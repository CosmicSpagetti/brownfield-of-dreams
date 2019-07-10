# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do 
  it 'Can not view classroom content' do 
    tutorial_1 = create(:tutorial, classroom: false )
    tutorial_2 = create(:tutorial, classroom: true)
    
    visit root_path
    
    expect(page).to have_content(tutorial_1.title)
    expect(page).to_not have_content(tutorial_2.title)
  end
end

describe 'As a visitor' do 
  it 'Can not view classroom content' do 
    user_billy = create(:user)
    tutorial_1 = create(:tutorial, classroom: false )
    tutorial_2 = create(:tutorial, classroom: true)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_billy)

    visit root_path
    
    expect(page).to have_content(tutorial_1.title)
    expect(page).to have_content(tutorial_2.title)
  end
end