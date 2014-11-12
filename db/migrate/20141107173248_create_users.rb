class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :password_digest
      t.string :gmail
      t.datetime :last_active

      t.timestamps
    end
  end
end
