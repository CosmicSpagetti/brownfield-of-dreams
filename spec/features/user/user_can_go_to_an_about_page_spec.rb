require 'rails_helper'

describe 'User', :js do
  it 'can see about page' do
    visit root_path

    click_on 'About'

    expect(current_path).to eq(about_path)

    expect(page).to have_content('Turing Tutorials')
  end
end