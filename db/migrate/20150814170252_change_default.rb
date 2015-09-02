class ChangeDefault < ActiveRecord::Migration
  def change
  	remove_column :cars, :offer_status
  	remove_column :trucks, :offer_status
  	remove_column :equips, :offer_status

  	add_column :cars, :offer_status, :integer, :default => 1, :null => false
  	add_column :trucks, :offer_status, :integer, :default => 1, :null => false
  	add_column :equips, :offer_status, :integer, :default => 1, :null => false
  end
end
