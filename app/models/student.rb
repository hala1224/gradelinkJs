class Student < ApplicationRecord

  has_many :grades
  has_many :courses, through: :grades
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, uniqueness: true


  # to see perticular student line  @student.grade
  # has_many :courses
  # has_many :users, through: :courses

end
