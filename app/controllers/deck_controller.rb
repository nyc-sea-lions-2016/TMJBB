get '/deck/:id' do 
  @deck = Deck.find(params[:id])
  erb :'/deck/show'
end