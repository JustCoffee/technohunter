class CreateBrandTrucks < ActiveRecord::Migration
  def change
    create_table :brand_trucks do |t|
      t.string :name

      t.timestamps
    end
  end
end
