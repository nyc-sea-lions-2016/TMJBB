class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.references :card, null: false, index: true
  		t.references :round, null: false, index: true
      t.references :user, null: false, index: true
  		t.string :response, null: false
      t.boolean :correct, default: false
  		t.timestamps null: false
  	end 
  end
end
