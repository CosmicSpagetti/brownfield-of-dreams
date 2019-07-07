# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :position }
  end
end
