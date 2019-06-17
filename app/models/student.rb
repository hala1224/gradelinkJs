class Student < ApplicationRecord
  has_many :courses
  has_many :users, through: :courses
  has_many :grades
  has_many :courses, through: :grades
end
