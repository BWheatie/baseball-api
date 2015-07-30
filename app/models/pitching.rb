class Pitching < ActiveRecord::Base
  self.table_name = "Pitching"
  belongs_to :person, foreign_key: "playerID"
end