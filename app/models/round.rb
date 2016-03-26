class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  
  validates :user_id, presence: true
  validates :deck_id, presence: true

    def game_over?
    self.deck.cards.where(correct: false).empty?
  end

end
