post '/rounds' do
  @round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  redirect "/users/show/#{@round.user_id}" if @round.deck.users_remaining_cards(users_guesses).empty?
  redirect "/rounds/#{@round.id}"
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  if @round.deck.users_remaining_cards(users_guesses).empty?
    @user = User.find_by(id: session[:id])
    erb :"/users/show"
  else
    @card = @round.deck.users_remaining_cards(users_guesses).sample
    session[:current_card_id] = @card.id
    erb :'/rounds/show'
  end
end
