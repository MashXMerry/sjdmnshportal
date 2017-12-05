class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :lrn
      t.string :section
      t.integer :level
      t.string :gender
      t.string :email

      t.timestamps
    end
  end
end
