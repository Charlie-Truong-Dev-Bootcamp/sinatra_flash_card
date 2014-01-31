get '/stats' do
  round = Round.find(session[:round_id])
  @deck_id = round.cards.first.deck.id
  @correct = round.guesses.where(correctness: 1).count
  @incorrect = round.guesses.where(correctness: -1).count
  @skipped = round.guesses.where(correctness: 0).count
  @percent = (@correct / (@correct + @incorrect + @skipped).to_f ) * 100.0
  erb :stats
end
