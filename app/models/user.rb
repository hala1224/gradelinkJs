class User < ApplicationRecord
  has_many :courses
  has_many :students, through: :courses

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex

    end
  end

end
