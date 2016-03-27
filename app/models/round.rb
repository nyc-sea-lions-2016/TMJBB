class Round < ActiveRecord::Base
    has_many :guesses
    belongs_to :user
    belongs_to :deck

    validates :user_id, presence: true
    validates :deck_id, presence: true

    def first_try(users_guesses)
        card_ids = self.deck.cards.map { |card| card.id }

        array = card_ids.map do |placeholder|
            users_guesses.select { |guess| guess.card_id == placeholder }
        end
        
        array.select { |guesses| guesses.length == 1 }.length
    end

    def correct_guesses
        self.guesses.where(correct: true).length
    end
end
