class Question < ActiveRecord::Base
  attr_accessible :abstract, :description, :prompt
  has_many :responses

  def yes_votes
    self.responses.where(vote: 'yes')
  end

  def no_votes
    self.responses.where(vote: 'no')
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

  def positive
    self.yes_votes.size >= self.no_votes.size
  end
end
