class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :comment, presence: true

   def student_attributes=(student_params)
      student = Student.find_or_create_by(student_params)
      self.student = student if student.valid? || !self.student
   end

end
