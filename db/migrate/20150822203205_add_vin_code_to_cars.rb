class AddVinCodeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :vin_code, :string, :null => false, :default => ""
    add_column :trucks, :vin_code, :string, :null => false, :default => ""
    add_column :equips, :vin_code, :string, :null => false, :default => ""
  end
end
