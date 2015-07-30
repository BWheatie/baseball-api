class Person < ActiveRecord::Base
  self.table_name = "Master"
  has_one :salary, foreign_key: "playerID"
  has_many :battings, foreign_key: "playerID"
  has_many :battingposts, foreign_key: "playerID" # errors if Person has no post stats
  has_many :fieldings, foreign_key: "playerID"
  has_many :fieldingposts, foreign_key: "playerID"
  has_many :pitchings, foreign_key: "playerID"
  has_many :pitchingposts, foreign_key: "playerID"
  has_and_belongs_to_many :teams, foreign_key: "teamID"
end