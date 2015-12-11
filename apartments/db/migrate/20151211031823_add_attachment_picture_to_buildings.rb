class AddAttachmentPictureToBuildings < ActiveRecord::Migration
  def self.up
    change_table :buildings do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :buildings, :picture
  end
end
