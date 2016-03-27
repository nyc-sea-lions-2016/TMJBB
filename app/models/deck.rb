class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates :name, presence: true

  def remaining_cards
    cards_left = []
    this_deck = self
    self.cards.each do |card|
      if card.guesses.empty? 
        cards_left << card
      else
        card.guesses.each do |guess|
          if guess.correct
            cards_left.delete(card)
          else
            cards_left << card if guess.user_id == this_deck.rounds.find_by(deck_id: id).user_id
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
