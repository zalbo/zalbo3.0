class AddAttachmentUplaodPhotoToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :uplaod_photo
    end
  end

  def self.down
    remove_attachment :images, :uplaod_photo
  end
end
