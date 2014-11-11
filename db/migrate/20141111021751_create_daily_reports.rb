class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.belongs_to :user
      t.date :created_at
      t.datetime :updated_at
    end
  end
end
