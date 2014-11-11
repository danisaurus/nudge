class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.belongs_to :user
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_at
      t.string :secret
      t.string :type

      t.timestamps
    end
  end
end
