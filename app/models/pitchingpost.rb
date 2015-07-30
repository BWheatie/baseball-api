class PitchingPost < ActiveRecord::Base
  self.table_name = "Pitchingpost"
  belongs_to :person, foreign_key: "playerID"
end