class CreateBrandEquips < ActiveRecord::Migration
  def change
    create_table :brand_equips do |t|
      t.string :name

      t.timestamps
    end
  end
end
