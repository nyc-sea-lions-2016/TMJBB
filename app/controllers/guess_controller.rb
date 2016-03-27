post '/guess' do
  if params[:response] == ""
    @errors = "Hey assface, you need to answer the question"
    erb :'/rounds/show'
  else
    @card = Card.find_by(id: session[:current_card_id])
    @guess = Guess.create(user_id: session[:id], card_id: @card.id, round_id: params[:round_id], response: params[:response])
    if @guess.response == @card.correct_answer
      @guess.correct = true
      @guess.save
    end
    session[:current_card_id] = nil
    redirect "/rounds/#{@guess.round_id}"
  end
end