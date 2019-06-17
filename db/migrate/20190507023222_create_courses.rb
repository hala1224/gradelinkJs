class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :coursename
      t.integer :user_id

      t.timestamps
    end
  end
end
