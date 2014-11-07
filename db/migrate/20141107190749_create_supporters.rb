class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.belongs_to :user, index: true
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :gmail
      t.string :twitter

      t.timestamps
    end
  end
end
