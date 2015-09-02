class Picture < ActiveRecord::Base
	belongs_to :car
	belongs_to :truck
	belongs_to :equip
	
	has_attached_file :image, :styles => {:small => "150x150>", :large => '600x600>'},
	    :path => ":rails_root/public/images/:id/:style/:filename",
	    :url  => "/images/:id/:style/:filename"

    do_not_validate_attachment_file_type :image
end
