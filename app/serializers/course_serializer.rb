class CourseSerializer < ActiveModel::Serializer
  attributes :id, :coursename, :user_id, :created_at
  belongs_to :user
  has_many :grades, dependent: :destroy
  has_many :students, through: :grades
end
