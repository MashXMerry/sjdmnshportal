class AddYearToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :year, :integer
  end
end
