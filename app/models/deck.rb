class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates :name, presence: true

  def users_remaining_cards(users_guesses)
    remaining_cards = self.cards.map do |card|
        users_card_guesses = users_guesses.select { |guess| guess.card_id == card.id }
        card if users_card_guesses.empty? || users_card_guesses.all? { |guess| !guess.correct }
      end
      remaining_cards.compact
  end

end
