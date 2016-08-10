class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.date :date
      t.references :class_journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
