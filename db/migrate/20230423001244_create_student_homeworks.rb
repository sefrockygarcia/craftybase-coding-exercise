class CreateStudentHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :student_homeworks do |t|
      t.datetime :submitted_at
      t.datetime :graded_at
      t.text :attachment
      t.text :note
      t.string :grade
      t.belongs_to :student, null: false
      t.belongs_to :homework, null: false

      t.timestamps
    end
  end
end
