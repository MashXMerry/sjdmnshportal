class AddRoleToAdministrator < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :role, :string
    add_column :administrators, :middlename, :string
  end
end
