class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer :user_id
      t.belongs_to :users
      t.timestamps
    end

    create_table :guesses do |t|
      t.integer :card_id
      t.integer :correctness
      t.integer :round_id
      t.belongs_to :card
      t.belongs_to :round
      t.timestamps
    end

    create_table :cards do |t|
      t.integer :deck_id
      t.string :question
      t.string :answer
      t.belongs_to :deck
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name
      t.timestamps
    end

    add_index :rounds, :user_id
    add_index :guesses, :card_id
    add_index :guesses, :round_id
    add_index :cards, :deck_id
  end
end
