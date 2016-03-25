class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :stats
  has_many :cards
  validates :name, presence: true
end
