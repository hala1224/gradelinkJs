class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :comment, presence: true

  # validates :value, uniqueness: true
  # , allow_blank: true

  # validates :student_id, presence: true
  # validates :course_id, presence: true
  # validates_associated :student
#
#   #accepts_nested_attributes_for :student
#Student.where('lower(name) = ?', name.downcase).first_or_create(:name=>name) 
   def student_attributes=(student_params)
      student = Student.find_or_create_by(student_params)
      self.student = student if student.valid? || !self.student
   end

end
