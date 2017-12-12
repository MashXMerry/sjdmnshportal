class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :section
      t.integer :yearlvl
      t.string :adviser

      t.timestamps
    end
  end
end
