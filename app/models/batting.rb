class Batting < ActiveRecord::Base
  self.table_name = "Batting"
  belongs_to :person, foreign_key: "playerID"

  def BA
    if self.AB && self.AB != 0 && self.H
      (self.H / self.AB.to_f).round(3)
    end
  end
end
