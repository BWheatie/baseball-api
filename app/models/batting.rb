class Batting < ActiveRecord::Base
  belongs_to :player
  validates_presence_of :player
end