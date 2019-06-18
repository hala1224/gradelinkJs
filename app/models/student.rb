class Student < ApplicationRecord

  has_many :grades
  has_many :courses, through: :grades
  # to see perticular student line 7 @student.users, @student.grade
  # has_many :courses
  # has_many :users, through: :courses
end
