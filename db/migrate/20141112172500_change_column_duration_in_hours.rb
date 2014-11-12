class ChangeColumnDurationInHours < ActiveRecord::Migration
  def change
    change_column :triggers, :duration_in_hours, :integer, :default => 1
  end
end
