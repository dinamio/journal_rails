class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.string :name
      t.string :surname
      t.references :form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
