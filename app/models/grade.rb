class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :comment, presence: true

  validates :student_id, presence: true
  validates :course_id, presence: true
  # validates_associated :student
#
#   #accepts_nested_attributes_for :student
#
#    def student_attributes=(attributes)
#       student = Student.find_or_create_by(attributes)
#       self.student = student if student.valid? || !self.student
#    end

end
