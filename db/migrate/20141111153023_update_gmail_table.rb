class UpdateGmailTable < ActiveRecord::Migration
  def change
    add_reference :gmails, :daily_report
    remove_column :gmails, :user_id
  end
end
