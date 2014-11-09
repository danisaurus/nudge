class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.integer :task_id
      t.belongs_to :user
      t.text :message_text
      t.integer :duration_in_hours
      t.datetime :time_last_run

      t.timestamps
    end
  end
end
