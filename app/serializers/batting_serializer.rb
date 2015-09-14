class BattingSerializer < ActiveModel::Serializer
  attributes :games, :atbats, :batting_runs, :batting_hits, :batting_doubles, :batting_triples, :batting_homeruns, :batting_rbi
  attributes :batting_stolenbases, :batting_caughtstealing, :batting_walk, :batting_strikeout, :batting_intentionalwalks
  attributes :batting_hitbypitch, :batting_sacbunt, :batting_sacfly, :batting_gidp, :avg, :slg, :obp, :ops, :iso, :babip, :pa, :tb
end