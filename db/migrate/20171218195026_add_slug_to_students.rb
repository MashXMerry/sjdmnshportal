class AddSlugToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :slug, :string
    add_index :students, :slug, unique: true
  end
end
