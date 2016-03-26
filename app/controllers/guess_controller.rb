post '/guess' do
  if params[:response] == ""
    @errors = "Hey assface, you need to answer the question"
    erb :'/rounds/show'
  else
    current_card
    @guess = Guess.create(card_id: @card.id, round_id: session[:round_id], response: params[:response])
    if @guess.response == @card.correct_answer
      @round = Round.find(session[:round_id])
      @round.current_card_index += 1
      @round.save
      
    end
    redirect '/rounds'
  end
end