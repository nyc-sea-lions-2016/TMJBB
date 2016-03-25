class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.references :card, null: false, index: true
  		t.references :round, null: false, index: true
  		t.string :response, null: false

  		t.timestamps null: false
  	end 
  end
end
