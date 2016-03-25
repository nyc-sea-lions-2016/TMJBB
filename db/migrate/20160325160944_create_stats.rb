class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.references :user, null: false, index: true
  		t.references :deck, null: false, index: true

  		t.timestamps null: false
  end
end
