class AddColumnActive < ActiveRecord::Migration
  def change
    add_column :triggers, :active, :boolean, :default => true
  end
end
