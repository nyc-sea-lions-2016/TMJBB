class Card < ActiveRecord::Base
  has_many :guesses
  belong_to :deck
  validates :question, presence: true
  validates :correct_answer, presence: true
  
end
