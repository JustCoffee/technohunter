class AddRegionTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :region, :string, :null => false
  	add_column :cars, :region, :string, :null => false
  	add_column :equips, :region, :string, :null => false
  end
end
