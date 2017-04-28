class Comment < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many   :votes, as: :votable
  def vote_total
    total=0
    self.votes.each {|v| total+=v.weight}
    total
  end
end
