class Player < ActiveRecord::Base
  has_many :appearances
  has_many :battings
  has_many :battingposts
  has_many :fieldings
  has_many :fieldingposts
  has_many :pitchings
  has_many :pitchingposts
  has_many :salaries
  has_and_belongs_to_many :teams

  def report
    Report.new(self)
  end

  def self.search(query)
    Player.where("nameFirst LIKE ? OR nameLast OR LIKE ? OR nameGiven LIKE ?", "%#{query}%")
  end

end