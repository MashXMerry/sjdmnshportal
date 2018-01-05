class AddUsernameToAdministrators < ActiveRecord::Migration[5.1]
  def change
    add_column :administrators, :username, :string
  end
end
