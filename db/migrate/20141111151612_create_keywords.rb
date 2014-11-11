class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :text
      t.float :relevance
      t.timestamps
    end
  end
end
