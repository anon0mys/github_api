class RemoveOauthSecretFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :oauth_secret
  end
end
