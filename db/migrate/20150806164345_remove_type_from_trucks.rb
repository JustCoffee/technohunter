class RemoveTypeFromTrucks < ActiveRecord::Migration
  def change
    remove_column :trucks, :type, :string
    add_column :trucks, :type_avto, :string
  end
end
