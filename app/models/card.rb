class Card < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  has_many :rounds, through: :guesses
  belongs_to :deck
end
