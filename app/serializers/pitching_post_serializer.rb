class PitchingPostSerializer < ActiveModel::Serializer
  attributes :G, :W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP
  attributes :WHIPpost, :SO9post, :H9post, :BB9post
end
