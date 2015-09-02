class AddAttachmentImageToEquips < ActiveRecord::Migration
  def self.up
    change_table :equips do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :equips, :image
  end
end
