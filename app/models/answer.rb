class Answer < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def date
    self.created_at.strftime("%b %d '%y at %H:%M")
  end
end
