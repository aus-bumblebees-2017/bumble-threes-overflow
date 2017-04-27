class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :description, presence: true

  def total_votes
    self.votes.count
  end

  def total_answers
    self.answers.count
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
