class GradeSerializer < ActiveModel::Serializer
  attributes :id, :value, :comment, :course_id, :student_id, :created_at
  belongs_to :student
  belongs_to :course
end
