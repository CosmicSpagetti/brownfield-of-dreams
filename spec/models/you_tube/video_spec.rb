require 'rails_helper'

RSpec.describe YouTube::Video do
  describe 'attributes' do 
    it 'should display attributes' do 
      data ={ :items=>
  [{:kind=>"youtube#video",
    :etag=>"\"XI7nbFXulYBIpL0ayR_gDh3eu1k/SJDrIfGc7itS0jdLd1wv3keQCpk\"",
    :id=>"J7ikFUlkP_k",
    :snippet=>
     {:publishedAt=>"2018-07-23T20:59:59.000Z",
      :channelId=>"UC2zYYOtckevoWTGDu5SdCkg",
      :title=>"Rails Integration Tests for Pages with JavaScript",
      :description=>
       "This video shows how to write feature/integration tests within RSpec configured to run expectations for pages that run JavaScript.",
      :thumbnails=>
       {:default=>{:url=>"https://i.ytimg.com/vi/J7ikFUlkP_k/default.jpg", :width=>120, :height=>90},
        :medium=>{:url=>"https://i.ytimg.com/vi/J7ikFUlkP_k/mqdefault.jpg", :width=>320, :height=>180},
        :high=>{:url=>"https://i.ytimg.com/vi/J7ikFUlkP_k/hqdefault.jpg", :width=>480, :height=>360} }}}]} 
      
        youtube = YouTube::Video.new(data)
        expect(youtube.thumbnail).to eq("https://i.ytimg.com/vi/J7ikFUlkP_k/hqdefault.jpg")
    end
  end
end