class AddHomeworkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :homework, :string
  end
end
