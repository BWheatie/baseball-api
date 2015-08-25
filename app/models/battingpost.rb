class BattingPost < ActiveRecord::Base
  self.table_name = "BattingPost"
  belongs_to :player, foreign_key: "playerID", primary_key: :legacy_id
end
