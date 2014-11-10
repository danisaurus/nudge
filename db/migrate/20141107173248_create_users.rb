class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :phone
      t.string :gmail
      t.string :twitter
      t.datetime :last_active

      t.timestamps
    end
  end
end
