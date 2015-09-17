class BattingPostSerializer < ActiveModel::Serializer
  attributes :battingpost_atbats, :battingpost_runs, :battingpost_hits, :battingpost_doubles, :battingpost_triples, :battingpost_homeruns
  attributes :battingpost_stolenbases, :battingpost_caughtstealing, :battingpost_walks, :battingpost_strikeouts, :battingpost_rbi
  attributes :battingpost_intentionalwalks, :battingpost_hitbypitch, :battingpost_sacbunts, :battingpost_sacflys, :battingpost_gidp
  attributes :avgpost, :slgpost, :obppost, :opspost, :isopost, :papost
end