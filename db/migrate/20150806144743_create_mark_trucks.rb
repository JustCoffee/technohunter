class CreateMarkTrucks < ActiveRecord::Migration
  def change
    create_table :mark_trucks do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
  end
end
