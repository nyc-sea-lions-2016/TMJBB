post '/rounds' do
  @round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  redirect "/users/show/#{@round.user_id}" if @round.game_over?
  redirect "/rounds/#{@round.id}"
end

get '/rounds/:id' do
  @round = Round.find(params[:id])

  if @round.game_over?
    @user = User.find_by(session[:id])
    erb :"/users/show"
  else
    @card = @round.deck.get_card
    session[:current_card_id] = @card.id
    erb :'/rounds/show'
  end
end
