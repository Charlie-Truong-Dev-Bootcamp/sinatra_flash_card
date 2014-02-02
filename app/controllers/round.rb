get "/round/:deck_id" do
  session[:round_id] = Round.create(user_id: session[:user_id]).id
  @cards = (Card.create_deck(params[:deck_id])).to_json
  @instruction = Deck.find(params[:deck_id]).instruction
  erb :rounds
end