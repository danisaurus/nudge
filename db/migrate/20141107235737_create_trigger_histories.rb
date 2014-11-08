class CreateTriggerHistories < ActiveRecord::Migration
  def change
    create_table :trigger_histories do |t|
      t.belongs_to :trigger
      t.belongs_to :user
      t.datetime :execution_date

      t.timestamps
    end
  end
end
