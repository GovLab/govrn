class BetaSignup < ActiveRecord::Base
  attr_accessible :email

  validates_uniqueness_of :email, message: "aready signed up"
end
