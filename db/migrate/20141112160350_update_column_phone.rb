class UpdateColumnPhone < ActiveRecord::Migration
  def change
  	update_column :users, :phone, :string
  end
end
