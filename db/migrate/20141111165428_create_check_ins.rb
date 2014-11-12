class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.belongs_to :daily_report
      t.integer :quantitative
      t.date :created_at
      t.datetime :updated_at
    end
  end
end
