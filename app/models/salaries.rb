class Salary < ActiveRecord::Base
  self.table_name = "Salary"
  belongs_to :player, foreign_key: "playerID", primary_key: :legacy_id
end