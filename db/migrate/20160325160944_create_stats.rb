class CreateStats < ActiveRecord::Migration
  def change
  	create_table :stats do |t|
  		t.references :user, null: false, index: true
  		t.references :deck, null: false, index: true

  end
end
