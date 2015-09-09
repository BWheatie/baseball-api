class BattingSerializer < ActiveModel::Serializer
  attributes :G, :AB, :R, :H, :HR, :RBI, :SB, :SO, :AVG, :SLG, :OBP, :OPS, :ISO, :BABIP, :PA
  belongs_to :player
end