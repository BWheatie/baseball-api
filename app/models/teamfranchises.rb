class TeamsFranchises < ActiveRecord::Base
  has_one :team, foreign_key: "teamID"
end