class Vote < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :votable, polymorphic: true
  def self.add_vote (votable,weight,current_user)
      vote = votable.votes.find( ) {
        # this code needs to check for a vote that
        # matches author and is associated with
        # this comment
        # something like the following
        # "#{v.votable_type}: #{v.votable_id}" == this
        # && v.author_id == user.id
        # for now it will never find and always
        # invoke the ifnone
      }
      # NOTE: the following should be able to be stuck into
      # the find argument but I couldnt decipher docs
      if vote == nil
        if current_user == nil
          vote = Vote.new(weight: weight)
        else
          vote = Vote.new(
            weight: weight,
            author: current_user)
        end

      end
      votable.votes << vote
      votable.save
  end
end
