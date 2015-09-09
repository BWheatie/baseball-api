class BattingPostSerializer < ActiveModel::Serializer
  attributes :G, :AB, :R, :H, :"2B", :"3B", :HR, :RBI, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP
  attributes :AVGpost, :SLGpost, :OBPpost, :OPSpost, :ISOpost, :BABIPpost, :PApost
end