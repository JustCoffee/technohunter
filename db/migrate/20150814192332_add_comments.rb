class AddComments < ActiveRecord::Migration
  def change
  	add_column :cars, :comment, :text, :null => false
  	add_column :trucks, :comment, :text, :null => false
  	add_column :equips, :comment, :text, :null => false
  end
end
