class AddAvailableToAdministrator < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :available, :string
  end
end
