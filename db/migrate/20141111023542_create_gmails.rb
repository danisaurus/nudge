class CreateGmails < ActiveRecord::Migration
  def change
    create_table :gmails do |t|
      t.belongs_to :user
      t.float :quantitative
      t.string :qualitative

      t.timestamps
    end
  end
end
