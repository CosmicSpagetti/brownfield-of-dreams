require "rails_helper"

describe 'a logged in user', :js do
  it 'can see bookmarked segments' do
    tutorial1 = create(:tutorial, title: 'How to Tie Your Shoes')
    tutorial2 = create(:tutorial, title: 'How to Brush Your Teeth')
    video1 = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial1, position: 1)
    video2 = create(:video, title: 'Right Over Left', tutorial: tutorial1, position: 2)
    video3 = create(:video, title: 'Use Velcro', tutorial: tutorial1, position: 3)
    video4 = create(:video, title: 'Electric Toothbrush', tutorial: tutorial2, position: 1)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial1)

click_on video1.title
      expect do
        click_on 'Bookmark'
      end.to change { UserVideo.count }.by(1)
click_on video2.title
      expect do
        click_on 'Bookmark'
      end.to change { UserVideo.count }.by(1)
click_on video3.title
      expect do
        click_on 'Bookmark'
      end.to change { UserVideo.count }.by(1)

    visit tutorial_path(tutorial2)

    expect do
      click_on 'Bookmark'
    end.to change { UserVideo.count }.by(1)

    visit dashboard_path

    within '.bookmarks' do
      expect(page).to have_content(tutorial1.title)
      expect(page.all("li")[0]).to have_content(video1.title)
      expect(page.all("li")[1]).to have_content(video2.title)
      expect(page.all("li")[2]).to have_content(video3.title)
    end
  end
end
