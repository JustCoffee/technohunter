class CreateEquips < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.string :city
      t.string :equip_type
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :hofuse
      t.string :status
      t.text :desc
      t.integer :price
      t.boolean :moder, :null => false, :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
