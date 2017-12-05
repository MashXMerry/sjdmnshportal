class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :subject
      t.integer :grade
      t.integer :quarter
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
