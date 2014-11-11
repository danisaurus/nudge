class RemoveColumnUserIdFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :user_id
  end
end
