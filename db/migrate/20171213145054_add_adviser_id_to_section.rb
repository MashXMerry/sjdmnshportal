class AddAdviserIdToSection < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :adviser_id, :integer
  end
end
