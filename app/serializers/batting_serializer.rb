class BattingSerializer < ActiveModel::Serializer
  attributes :yearID, :stint, :teamID, :G, :AB, :R, :H, :HR, :RBI, :SB, :SO
  belongs_to :player
end