class CreateGradings < ActiveRecord::Migration[5.1]
  def change
    create_table :gradings do |t|
      t.string :subject
      t.integer :yearlvl
      t.integer :student_id
      t.integer :subject_id
      t.integer :quarter
      t.integer :grade
      t.integer :adviser_id

      t.timestamps
    end
  end
end
