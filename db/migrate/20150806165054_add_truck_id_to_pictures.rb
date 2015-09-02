class AddTruckIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :truck_id, :integer
  end
end
