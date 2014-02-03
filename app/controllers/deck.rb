get '/decks' do
  @session_active = session[:user_id]
  @decks = Deck.all
  erb :decks
end
