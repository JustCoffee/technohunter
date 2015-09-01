class Ggg < ActiveRecord::Migration
  def change
    create_table :cars do |t|
	    t.string   "city"
	    t.string   "auto_type"
	    t.string   "model"
	    t.integer  "year"
	    t.string   "sost"
	    t.text     "desc"
	    t.integer  "price"
	    t.string   "engine"
	    t.string   "cuzov"
	    t.string   "probeg"
	    t.string   "kpp"
	    t.string   "engv"
	    t.string   "privod"
	    t.integer  "user_id"
	    t.string   "brand"
	    t.string   "photo"
	    t.boolean  "moder",                         default: false
	    t.string   "image_file_name"
	    t.string   "image_content_type"
	    t.integer  "image_file_size"
	    t.datetime "image_updated_at"

	    t.timestamps
    end
  end
end
