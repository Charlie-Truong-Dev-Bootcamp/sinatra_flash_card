require 'csv'

Deck.create(name: "world capitals")

CSV.table(File.dirname(__FILE__)+"/../db/world_capitals.csv").each do |col|
  Card.create(question: col[:question], answer: col[:answer], deck_id: 1)
end

