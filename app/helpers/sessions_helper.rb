helpers do

  def current_user
    @user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !!current_user
  end

  def users_guesses
  	users_guesses = Guess.where(user_id: session[:id])
  end

  	# def users_remaining_cards
  	# 	users_guesses = Guess.where(user_id: session[:id])
  	# 	remaining_cards = self.cards.map do |card|
  	# 		users_card_guesses = users_guesses.select { |guess| guess.card_id == card.id }
  	# 		return card if users_card_guesses.empty? || users_card_guesses.any? { |guess| !guess.correct }
  	# 	end
  	# end

end
