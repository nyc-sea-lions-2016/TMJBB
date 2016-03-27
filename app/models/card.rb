class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  
  validates :question, :correct_answer, presence: true
end
