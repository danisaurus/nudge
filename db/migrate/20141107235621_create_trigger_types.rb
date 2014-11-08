class CreateTriggerTypes < ActiveRecord::Migration
  def change
    create_table :trigger_check do |t|
      t.string :method_name
      t.integer :frequency_to_run

      t.timestamps
    end
  end
end
