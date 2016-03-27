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
            cards_left << card if guess.user_id == self.rounds.find_by(deck_id: id).user_id
          end
        end
      end
    end
    cards_left
  end

  def get_card
    remaining_cards.sample
  end
end
