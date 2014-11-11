class AddGmailToKeywords < ActiveRecord::Migration
  def change
    add_reference :keywords, :gmail
  end
end
