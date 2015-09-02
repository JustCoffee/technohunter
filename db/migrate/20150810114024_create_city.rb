class CreateCity < ActiveRecord::Migration
  def change
    create_table :city do |t|
      t.integer :city_id, :null => false
      t.integer :country_id, :null => false, :default => false
      t.integer :region_id, :null => false, :default => false
      t.string :name, :null => false, :default => ""
    end
  end
end
