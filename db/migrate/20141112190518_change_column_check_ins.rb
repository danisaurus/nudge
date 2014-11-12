class ChangeColumnCheckIns < ActiveRecord::Migration
  def change
  	change_column :check_ins, :quantitative, :float
  end
end
