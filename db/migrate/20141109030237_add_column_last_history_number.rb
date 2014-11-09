class AddColumnLastHistoryNumber < ActiveRecord::Migration
  def change
    add_column :users, :last_history_number, :string
  end
end
