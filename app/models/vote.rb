class Vote < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :votable, polymorphic: true
  def self.add_vote (votable,weight,current_user)
      vote = votable.votes.find( ) { |v|
        v.author_id == current_user.id
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

        votable.votes << vote
        votable.save
      else
        vote.weight=weight
        vote.save
      end

  end
end
