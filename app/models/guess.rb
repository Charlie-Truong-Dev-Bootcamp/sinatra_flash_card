class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  def self.add_guesses(guesses, round_id)
    for x in 0...10
      create(card_id: guesses[x][:card_id], round_id: round_id, correctness: guesses[x][:correctness])
    end
  end
end
