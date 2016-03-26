post '/guess' do
  if params[:response] == ""
    @errors = "Hey assface, you need to answer the question"
    erb :'/rounds/show'
  else
    @card = Card.find_by(id: session[:current_card_id])
    @guess = Guess.create(card_id: @card.id, round_id: params[:round_id], response: params[:response])
    if @guess.response == @card.correct_answer
      @card.correct = true
      @card.save
    end
    redirect "/rounds/#{@guess.round_id}"
  end
end