class Team < ActiveRecord::Base
  has_many :people, foreign_key: "playerID"
end