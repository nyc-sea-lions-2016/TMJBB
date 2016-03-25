class Guess < ActiveRecord::Base
  validates :card_id, :round_id, :response, presence: true
end
