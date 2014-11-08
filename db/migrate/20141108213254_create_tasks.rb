class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :method_name
      t.integer :frequency

      t.timestamps
    end
  end
end
