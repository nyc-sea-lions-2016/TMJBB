get '/deck/index' do
  @deck = Deck.new
  @decks = Deck.all
  erb :'/deck/index'
end

get '/deck/:id' do 
  @deck = Deck.find(params[:id])
  erb :'/deck/show'
end

