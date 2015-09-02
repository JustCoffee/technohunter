class ChangeDefUser < ActiveRecord::Migration
  def change
  	change_column_default :users, :user_role, ""
  end
end
