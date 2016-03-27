class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  belongs_to :round

  validates :card_id, :round_id, :user_id, :response, presence: true
end
