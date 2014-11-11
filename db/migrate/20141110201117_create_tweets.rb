class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user
      t.string :qualitative
      t.float :quantitative
      t.integer :id_of_tweet, limit: 8
      t.timestamps
    end
  end
end
