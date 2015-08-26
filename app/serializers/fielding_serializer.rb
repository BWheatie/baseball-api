class FieldingSerializer < ActiveModel::Serializer
  attributes :yearID, :stint, :teamID, :POS, :G, :GS, :InnOuts, :PO, :A, :E, :DP, :PB, :WP, :SB
  attributes :CS, :ZR
  belongs_to :player
end
