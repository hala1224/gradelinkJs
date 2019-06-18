class Course < ApplicationRecord
  belongs_to :user
  has_many :grades
  has_many :students, through: :grades


  validates :coursename, presence: true
  validates :user_id, optional: false
  validates :coursename, uniqueness: true

end
