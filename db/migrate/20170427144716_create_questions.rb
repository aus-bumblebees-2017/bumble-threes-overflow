class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title
      t.string  :description
      t.integer :author_id
      t.timestamps(null: false)
    end
  end
end
