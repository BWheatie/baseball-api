class FieldingPost < ActiveRecord::Base
  self.table_name = "FieldingPost"
  belongs_to :player, foreign_key: "playerID", primary_key: :legacy_id
end
