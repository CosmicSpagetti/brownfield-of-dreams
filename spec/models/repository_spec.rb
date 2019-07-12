# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository do
  describe "Attributes" do 
    it "should display attributes" do 
      repo = {name: "Billy", html_url: "blah.com"}
      repository = Repository.new(repo)

      expect(repository.name).to eq("Billy")
      expect(repository.url).to eq("blah.com")
    end
  end 
end