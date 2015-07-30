class BattingSerializer < ActiveModel::Serializer
  cache key: 'batting', expires_in: 1.day
  attributes :G, :RBI, :AB, :R, :H, '2B', '3B', :HR, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP, :BA
  belongs_to :person
  url :batting
end
