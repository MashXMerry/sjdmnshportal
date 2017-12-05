class AddDetailsToAdministrator < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :firstname, :string
    add_column :administrators, :lastname, :string
  end
end
