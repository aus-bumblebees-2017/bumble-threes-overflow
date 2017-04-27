class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id
end