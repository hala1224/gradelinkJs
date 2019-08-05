class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  has_many :grades
  has_many :courses, through: :grades

end
