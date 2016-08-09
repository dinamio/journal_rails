class CreateFormsSubjectJoinTable < ActiveRecord::Migration
  def change
    create_join_table :forms, :subjects do |t|
      # t.index [:form_id, :subject_id]
      # t.index [:subject_id, :form_id]
    end
  end
end
