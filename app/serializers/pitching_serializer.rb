class PitchingSerializer < ActiveModel::Serializer
  attributes :yearID, :stint, :teamID, :W, :L, :G, :GS, :CG, :SHO, :SV, :BAOpp, :ERA
  belongs_to :player
end
