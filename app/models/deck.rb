class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  validates :name, presence: true


  def users_remaining_cards(users_guesses)
    remaining_cards = self.cards.map do |card|
        users_card_guesses = users_guesses.select { |guess| guess.card_id == card.id }
        return card if users_card_guesses.empty? || users_card_guesses.any? { |guess| !guess.correct }
      end
  end


  # def remaining_cards
  #   cards_left = []
  #   this_deck = self
  #   self.cards.each do |card|
  #     binding.pry

  #     users_guesses = Guess.where(user_id: session[:id])




  #     if guess.user_id == this_deck.rounds.find_by(deck_id: id).user_id
  #       if card.guesses.empty? 
  #         cards_left << card
  #       else
  #         card.guesses.each do |guess|
  #           if guess.correct
  #             cards_left.delete(card)
  #           else
  #             binding.pry
  #             cards_left << card
  #           end
  #         end
  #       end
  #     end
  #   end
  #   cards_left
  # end

  # def get_card
  #   users_remaining_cards.sample
  # end
end
