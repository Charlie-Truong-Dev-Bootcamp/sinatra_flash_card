class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  def self.add_guesses(card_ids, round_id, performance)
    for x in 0...10
      create(card_id: card_ids[x], round_id: round_id, correctness: performance[x])
    end
  end
end
