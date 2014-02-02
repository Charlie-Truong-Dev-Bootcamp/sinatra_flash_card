class Card < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  has_many :rounds, through: :guesses
  belongs_to :deck

  def self.create_deck(deck_id)
    cards = Card.where(deck_id: deck_id).sample(10)
    cards.map{ |card| {card_id: card.id, question: card.question, answer: card.answer} }
  end

end
