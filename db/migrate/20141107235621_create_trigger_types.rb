class CreateTriggerTypes < ActiveRecord::Migration
  def change
    create_table :trigger_types do |t|
      t.string :method_name
      t.integer :frequency_to_run

      t.timestamps
    end
  end
end
