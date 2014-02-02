require 'pry'
require 'csv'

CSV_DECKS = [ {object: Deck.create(name: "world capitals", instruction: "Name this country's capital city"), path: "world_capitals.csv"},
              {object: Deck.create(name: "gre vocabulary", instruction: "What word does this describe?"), path: "GRE_vocab.csv"}
            ]

CSV_DECKS.each do |deck|
  CSV.table(File.dirname(__FILE__)+"/../db/" + deck[:path]).each do |col|
    Card.create(question: col[:question], answer: col[:answer], deck_id: deck[:object].id)
  end
end
