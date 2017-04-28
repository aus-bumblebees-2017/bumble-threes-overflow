class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= BCrypt::Password.new(hash_pw)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hash_pw = @password
  end

  def self.authenticate(username, given_password)
      user = User.find_by(username: username)
      if user != nil && user.password == given_password
        return user
      else
        return nil
      end
  end

end
