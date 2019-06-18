class User < ApplicationRecord

  
  has_many :courses
  has_many :students, through: :courses



  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password


end
