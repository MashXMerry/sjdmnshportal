class AddYearlvlToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :yearlvl, :integer
  end
end
