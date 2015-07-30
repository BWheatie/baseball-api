class FieldingPost < ActiveRecord::Base
  self.table_name = "FieldingPost"
  belongs_to :person, foreign_key: "playerID"
end
