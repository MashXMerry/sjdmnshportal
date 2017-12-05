class AddAttachmentImageToAnnouncements < ActiveRecord::Migration[5.1]
  def self.up
    change_table :announcements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :announcements, :image
  end
end
