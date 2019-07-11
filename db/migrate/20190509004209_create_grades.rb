class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :value, default: => 0
      t.text  :comment, default: =>"No Comment"
      t.belongs_to :course, foreign_key: true
      t.belongs_to :student, foreign_key: true

      t.timestamps
    end
  end
end
