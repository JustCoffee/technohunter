class AddAttachmentImageToTrucks < ActiveRecord::Migration
  def self.up
    change_table :trucks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :trucks, :image
  end
end
