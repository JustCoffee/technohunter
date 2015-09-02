class AddEquipIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :equip_id, :integer
  end
end
