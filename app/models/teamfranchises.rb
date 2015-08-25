class TeamsFranchises < ActiveRecord::Base
  has_one :team, foreign_key: "teamID", primary_key: :legacy_id
end