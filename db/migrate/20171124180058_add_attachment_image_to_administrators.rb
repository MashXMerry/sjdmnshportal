class AddAttachmentImageToAdministrators < ActiveRecord::Migration[5.1]
  def self.up
    change_table :administrators do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :administrators, :image
  end
end
