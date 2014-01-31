class Card < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  has_many :rounds, through: :guesses
  belongs_to :deck

  def self.create_deck(deck_id)
    cards = Card.where(deck_id: deck_id).sample(10)
    cards.map{ |card| card.id }
  end

  def check_answer(guess)
    if answer.downcase == guess.downcase
      return 1
    elsif guess == ""
      return 0
    else
      return -1
    end
  end
end
