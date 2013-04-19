class Response < ActiveRecord::Base
  attr_accessible :question_id, :vote
  belongs_to :question
end
