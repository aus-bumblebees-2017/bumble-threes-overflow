class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id

  def password
    @password ||= BCrypt::Password.new(hash_pw)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hash_pw = @password
  end

end
