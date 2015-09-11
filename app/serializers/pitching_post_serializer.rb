class PitchingPostSerializer < ActiveModel::Serializer
  attributes :G, :W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP
  attributes :WHIPpost
end
