class ChangeTableNames < ActiveRecord::Migration
  def change
    rename_table :AllstarFull, :allstars
    rename_table :Appearances, :appearances
    rename_table :Batting, :battings
    rename_table :Fielding, :fieldings
    rename_table :Managers, :managers
    rename_table :Pitching, :pitchings
    rename_table :Teams, :teams
  end
end
