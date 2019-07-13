# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
  end 

  describe "Relationships" do 
    it {should have_many :videos}
  end
end
