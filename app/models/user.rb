class User < ActiveRecord::Base
  attr_accessible :email, :role, :udid, :zip

  has_many :questions
  has_many :responses
end
