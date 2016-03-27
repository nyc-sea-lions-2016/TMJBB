class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates :name, presence: true

  def remaining_cards
    cards_left = []
    self.cards.each do |card|
      if card.guesses.empty? 
        cards_left << card
      else
        card.guesses.each do |guess|
          unless guess.correct
            cards_left << card
          end
        end
      end
    end
    # cards_left.select { |card| card.}
  end

  def get_card
    remaining_cards.sample
  end
end
