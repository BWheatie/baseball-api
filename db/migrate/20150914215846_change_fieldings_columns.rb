class ChangeFieldingsColumns < ActiveRecord::Migration
  def change
    rename_column :fieldings, :G, :fielding_games
    rename_column :fieldings, :GS, :fielding_gamesstarted
    rename_column :fieldings, :InnOuts, :fielding_innouts
    rename_column :fieldings, :PO, :fielding_putouts
    rename_column :fieldings, :A, :fielding_assists
    rename_column :fieldings, :E, :fielding_errors
    rename_column :fieldings, :DP, :fielding_doubleplay
    rename_column :fieldings, :PB, :fielding_passedballs
    rename_column :fieldings, :WP, :fielding_wildpitches
    rename_column :fieldings, :SB, :fielding_stolenbases
    rename_column :fieldings, :CS, :fielding_caughtstealing
    rename_column :fieldings, :ZR, :fielding_zonerating
  end
end
