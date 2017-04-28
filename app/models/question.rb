class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :description, presence: true

  def vote_total
    total=0
    self.votes.each {|v| total+=v.weight}
    total
  end

  def answers_total
    self.answers.count
  end

  def time_since_creation
    ((Time.now - self.created_at) / 3600).round
  end

end
