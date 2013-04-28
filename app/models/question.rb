class Question < ActiveRecord::Base
  attr_accessible :abstract, :description, :prompt

  belongs_to :user
  has_many :responses

  def RESPONSE_OPTIONS
    ['yes', 'no', 'undecided']
  end

  def yes_votes
    self.responses.where(vote: self.RESPONSE_OPTIONS[0])
  end

  def no_votes
    self.responses.where(vote: self.RESPONSE_OPTIONS[1])
  end

  def undecided_votes
    self.responses.where(vote: nil)
  end

  def yes_fraction
    self.yes_votes.size.to_f / self.responses.size
  end

  def no_fraction
    self.no_votes.size.to_f / self.responses.size
  end

  def undecided_fraction
    self.undecided_votes.size.to_f / self.responses.size
  end

  def positive
    self.majority_response_type == self.RESPONSE_OPTIONS[0]
  end

  def negative
    self.majority_response_type == self.RESPONSE_OPTIONS[1]
  end

  def undecided
    self.majority_response_type == self.RESPONSE_OPTIONS[2]
  end

  def votes_by_type
    [self.yes_votes.size, self.no_votes.size, self.undecided_votes.size]
  end

  def majority_response
    self.votes_by_type.max
  end

  def majority_response_type
    index = self.votes_by_type.index(self.majority_response)
    self.RESPONSE_OPTIONS[index]  ## if more than one max, will return the first in keys array
  end
end
