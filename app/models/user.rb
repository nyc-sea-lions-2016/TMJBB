class User < ActiveRecord::Base
  has_secure_password

  has_many :decks
  has_many :stats

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
