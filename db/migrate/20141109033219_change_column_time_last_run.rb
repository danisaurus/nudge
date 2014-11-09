class ChangeColumnTimeLastRun < ActiveRecord::Migration
  def change
    change_column :triggers, :time_last_run, :datetime, :default => Time.now
  end
end
