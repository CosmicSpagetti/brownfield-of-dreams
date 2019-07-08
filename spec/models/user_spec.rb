# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password) }
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name: 'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name: 'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end
  describe 'Instance methods' do 
    it '.shake_hand' do 
      user_billy = User.create!(email: 'billy@example.com',
                             first_name: 'Billy',
                             last_name: 'Urrutia',
                             password: 'password',
                             username: 'CosmicSpagetti',
                             github_token: ENV['BILLY_GITHUB_TOKEN'])
      user_earl = User.create!(email: 'earl@example.com',
                            first_name: 'Earl',
                            last_name: 'Stephens',
                            password: 'password',
                            username: 'earl-stephens',
                            github_token: ENV['EARL_GITHUB_TOKEN'])
      
      user_billy.shake_hand(user_earl)
      user_billy.reload
      expect(user_billy.friend_users).to include(user_earl)
    end
  end
end
