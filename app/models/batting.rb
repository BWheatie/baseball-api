class Batting < ActiveRecord::Base
  self.table_name = "Batting"
  belongs_to :person, foreign_key: "playerID"
end