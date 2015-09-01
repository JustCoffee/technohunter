class AddStatusToTables < ActiveRecord::Migration
  def change
  	add_column :cars, :offer_status, :string, :null => false, :default => ""
  	add_column :trucks, :offer_status, :string, :null => false, :default => ""
  	add_column :equips, :offer_status, :string, :null => false, :default => ""
  end
end
