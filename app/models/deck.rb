class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  validates :name, presence: true

  def get_card
    self.cards.select { |card| card.guesses.select { |guess| guess.correct == false } }.sample
  end
end
