class CreateMarkEquips < ActiveRecord::Migration
  def change
    create_table :mark_equips do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
  end
end
