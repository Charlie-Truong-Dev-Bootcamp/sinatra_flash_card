get "/randomcards" do
  content_type :json
  deck_id = params[:location][-1]
  cards = Card.create_deck(deck_id)
  cards.to_json
end
