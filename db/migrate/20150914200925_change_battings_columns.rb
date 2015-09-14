class ChangeBattingsColumns < ActiveRecord::Migration
  def change
    rename_column :battings, :G, :games
    rename_column :battings, :AB, :atbats
    rename_column :battings, :R, :batting_runs
    rename_column :battings, :H, :batting_hits
    rename_column :battings, :"2B", :batting_doubles
    rename_column :battings, :"3B", :batting_triples
    rename_column :battings, :HR, :batting_homeruns
    rename_column :battings, :RBI, :batting_rbi
    rename_column :battings, :SB, :batting_stolenbases
    rename_column :battings, :CS, :batting_caughtstealing
    rename_column :battings, :BB, :batting_walk
    rename_column :battings, :SO, :batting_strikeout
    rename_column :battings, :IBB, :batting_intentionalwalks
    rename_column :battings, :HBP, :batting_hitbypitch
    rename_column :battings, :SH, :batting_sacbunt
    rename_column :battings, :SF, :batting_sacfly
    rename_column :battings, :GIDP, :batting_gidp
  end
end
