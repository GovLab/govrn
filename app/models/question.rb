class Question < ActiveRecord::Base
  attr_accessible :abstract, :description, :prompt
  has_many :responses

  def average
  	responses = self.responses
  	if responses.size.to_f == 0
  		return -1
  	else
  		return (responses.sum(:vote) / responses.size.to_f)
  	end
  end
end
