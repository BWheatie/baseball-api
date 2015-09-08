class Player < ActiveRecord::Base
  validates :name_first, :name_last, presence: true
  has_many :appearances
  has_many :battings
  has_many :battingposts
  has_many :fieldings
  has_many :fieldingposts
  has_many :pitchings
  has_many :pitchingposts
  has_many :appearances
  has_and_belongs_to_many :teams

  def report
    Report.new(self)
  end

  def self.search(query)
    q = "%#{query}%"
    Player.where("name_first ILIKE ? OR name_last ILIKE ?", q, q)
  end

end