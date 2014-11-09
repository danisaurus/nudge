class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :method
      t.integer :frequency

      t.timestamps
    end
  end
end
