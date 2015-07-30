class Salary < ActiveRecord::Base
  self.table_name = "Salary"
  belongs_to :person, foreign_key: "playerID"
end