class Deck < ActiveRecord::Base
  belong_to :user
  has_many :stats
  validates :name, presence: true
end
