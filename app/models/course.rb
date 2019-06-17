class Course < ApplicationRecord
  
  has_many :grades
  has_many :students, through: :grades
  belongs_to :user
  # get rid off  belongs_to :student
  # , optional: true

  # validate :duplicate
  validates :coursename, presence: true
  # validates :student_id, presence: true
  # validates_associated :student
#
#   #accepts_nested_attributes_for :student
#
#    def student_attributes=(attributes)
#       student = Student.find_or_create_by(attributes)
#       self.student = student if student.valid? || !self.student
#    end
#
# # Change that can have same name 4 courses Max
#
#   def duplicate
#     if Course.find_by(coursename: coursename)
#       errors.add(:coursename, "This Course has already been created")
#     end
#   end

end
