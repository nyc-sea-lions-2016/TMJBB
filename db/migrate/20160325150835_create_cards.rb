class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.references :deck, index: true
      t.timestamps null: false
      t.string :correct_answer, null: false
    end
  end
end
