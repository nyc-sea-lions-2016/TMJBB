class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :correct_answer, null: false
      t.reference :deck_id, index: true
      t.timestamps null: false
    end
  end
end
