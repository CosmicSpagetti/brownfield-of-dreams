# frozen_string_literal: true

require 'rails_helper'

describe 'visitor visits video show page', :js do
  it 'clicks on the bookmark page and is given a flash message to log it' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit tutorial_path(tutorial)

    expect(page).to have_content("User must log in to Bookmark Videos.")
  end
end
