class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :mark
      t.references :lesson, index: true, foreign_key: true
      t.references :pupil, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
