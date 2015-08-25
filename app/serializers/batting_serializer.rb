class BattingSerializer < ActiveModel::Serializer
  attributes :G, :AB, :R, :H, :HR, :RBI, :SB, :SO
  belongs_to :player
end
