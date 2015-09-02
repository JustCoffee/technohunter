class ChangeDefTrucks < ActiveRecord::Migration
  def change
	change_column_null :trucks, :comment, true
	change_column_null :cars, :comment, true
	change_column_null :equips, :comment, true
  end
end
