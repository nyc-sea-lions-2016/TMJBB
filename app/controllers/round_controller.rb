post '/rounds' do
  @round = Round.create(user_id: session[:id], deck_id: params[:deck_id])
  session[:round_id] = @round.id
  current_deck
  current_card
  erb :'/rounds/show'
end

get '/rounds' do
  current_card
  # current_index
  erb :'/rounds/show'
end
