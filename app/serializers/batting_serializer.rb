class BattingSerializer < ActiveModel::Serializer
  attributes :G, :AB, :R, :H, :"2B", :"3B", :HR, :RBI, :SB, :CS, :BB, :SO, :IBB, :HBP, :SH, :SF, :GIDP
  attributes :AVG, :SLG, :OBP, :OPS, :ISO, :BABIP, :PA
end