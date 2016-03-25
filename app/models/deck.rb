class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :stats
  validates :name, presence: true
end
