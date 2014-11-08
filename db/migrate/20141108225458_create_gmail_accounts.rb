class CreateGmailAccounts < ActiveRecord::Migration
  def change
    create_table :gmail_accounts do |t|
      t.string :last_history_number
      t.belongs_to :user
    end
  end
end
