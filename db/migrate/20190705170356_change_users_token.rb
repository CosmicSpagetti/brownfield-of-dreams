class ChangeUsersToken < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :github_oauth_token
  end
end
