class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer   :author_id
      t.integer   :votable_id
      t.string  :votable_type
      t.integer   :weight
      t.timestamps(null: false)
    end
  end
end
