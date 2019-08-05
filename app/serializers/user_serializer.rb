class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :email, :password_digest, :created_at
  has_many :courses
  has_many :students, through: :courses

end
