class Fielding < ActiveRecord::Base
  self.table_name = "Fielding"
  belongs_to :person, foreign_key: "playerID"
end