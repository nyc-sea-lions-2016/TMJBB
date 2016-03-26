helpers do

def current_card
  @card ||= Round.find(session[:round_id]).deck.cards.first #we need to store current position in the deck
end

def current_index
  @current_index ||= Round.find(session[:round_id]).deck[@round.current_card_index]
end

def current_deck
  @deck ||= Deck.find_by(id: params[:deck_id])
end

end