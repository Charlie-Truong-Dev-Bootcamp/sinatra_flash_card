require 'pry'

get "/round/:deck_id" do
  @cards = Card.create_deck(params[:deck_id])
  session[:cards] = @cards
  session[:num] = 0
  @card = find_a_card ## i == counter, how pass one to the next?
  # @at_count = session[:num]
  # session[:correctness] = Array.new
  ## instance variable to hold a card
  ## get an answer for it
  ## pop card off session[:cards]

  erb :rounds
end

post "/round/:deck_id" do
  if find_a_card.answer == params[:answer]
    # session[:correctness].push(1)
  elsif params[:answer] == ""
    # session[:correctness].push(0)
  else
    # session[:correctness].push(-1)
  end
  session[:num] += 1
  # @at_count = session[:num]
  @card = find_a_card
  ## if not last card do this
  erb :rounds
  ## else rounte to erb :stats
end
