get "/round/:deck_id" do
  session[:round_id] = Round.create(user_id: session[:user_id]).id
  @cards = Card.create_deck(params[:deck_id])
  session[:cards] = @cards
  session[:num] = 0
  @card = current_card
  session[:correctness] = Array.new
  erb :rounds
end

post "/round/:deck_id" do
  @feedback = current_card.check_answer(params[:answer])
  @answer = current_card.answer
  session[:correctness].push(@feedback)
  session[:num] += 1
  if session[:num] < 10
    @card = current_card
    content_type :json
    {:feedback => feedback_display(@feedback,@answer), :card => @card.question,
     :num => session[:num]}.to_json
  else
    Guess.add_guesses(session[:cards], session[:round_id], session[:correctness])
    content_type :json
    {:feedback => feedback_display(@feedback,@answer),
     :redirect => "http://http://127.0.0.1:9393/stats"}.to_json
  end
end











