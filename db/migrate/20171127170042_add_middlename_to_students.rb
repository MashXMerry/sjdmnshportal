class AddMiddlenameToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :middlename, :string
  end
end
