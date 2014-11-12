class RemoveGmailFromSupporters < ActiveRecord::Migration
  def change
    remove_column :supporters, :gmail, :string
  end
end
