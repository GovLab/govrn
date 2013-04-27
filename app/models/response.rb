class Response < ActiveRecord::Base
  attr_accessible :question_id, :vote
  belongs_to :question

  validates_inclusion_of :vote, in: %w(yes no), allow_nil: true
end
