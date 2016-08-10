class CreateClassJournals < ActiveRecord::Migration
  def change
    create_table :class_journals do |t|
      t.references :form, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
