class Question < ActiveRecord::Base
  attr_accessible :abstract, :description, :prompt
  def average
  	return 0.113
  end
end
