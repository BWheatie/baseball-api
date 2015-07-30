class BattingPost < ActiveRecord::Base
  self.table_name = "BattingPost"
  belongs_to :person, foreign_key: "playerID"
end
