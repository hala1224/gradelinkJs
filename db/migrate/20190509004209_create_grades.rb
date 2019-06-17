class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :value
      t.text  :comment
      t.integer :course_id
      t.integer :student_id 
      t.timestamps
    end
  end
end
