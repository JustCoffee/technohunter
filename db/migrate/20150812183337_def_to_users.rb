class DefToUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :user_role, 1
  end
end
