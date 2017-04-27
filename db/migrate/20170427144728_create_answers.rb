class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string  :description
      t.integer :author_id
      t.integer :question_id
      t.boolean :best_answer
      t.timestamps(null:false)
    end
  end
end
