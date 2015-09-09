class PitchingSerializer < ActiveModel::Serializer
  attributes :G, :W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP
  attributes :WHIP, :SO9, :H9, :BB9
end
