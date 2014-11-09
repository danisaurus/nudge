class AddColumnUserIdToTokens < ActiveRecord::Migration
  def change
    add_reference :tokens, :user
  end
end
