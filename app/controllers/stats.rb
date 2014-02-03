require 'pry'

get '/stats' do
  round = Round.find(session[:round_id])

  @deck_id = round.cards.first.deck.id
  @correct = round.guesses.where(correctness: 1).count
  @incorrect = round.guesses.where(correctness: -1).count
  @skipped = round.guesses.where(correctness: 0).count
  @percent = (@correct / (@correct + @incorrect + @skipped).to_f ) * 100.0

  @global_correct = Card.includes(:guesses).where(deck_id: @deck_id, "guesses.correctness" => 1) 
  @global_incorrect = Card.includes(:guesses).where(deck_id: @deck_id, "guesses.correctness" => -1) 
  @global_skipped = Card.includes(:guesses).where(deck_id: @deck_id, "guesses.correctness" => 0)
  @global_percent = (@global_correct / (@global_correct + @global_incorrect + @global_skipped).to_f ) * 100.0
  
  erb :stats
end
