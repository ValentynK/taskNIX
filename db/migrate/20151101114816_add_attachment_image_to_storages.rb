class AddAttachmentImageToStorages < ActiveRecord::Migration
  def self.up
    change_table :storages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :storages, :image
  end
end
