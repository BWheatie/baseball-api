class ChangeFieldingPostsColumns < ActiveRecord::Migration
  def change
    rename_column :fieldingposts, :G, :fieldingpost_games
    rename_column :fieldingposts, :GS, :fieldingpost_gamesstarted
    rename_column :fieldingposts, :InnOuts, :fieldingpost_innouts
    rename_column :fieldingposts, :PO, :fieldingpost_putouts
    rename_column :fieldingposts, :A, :fieldingpost_assists
    rename_column :fieldingposts, :E, :fieldingpost_errors
    rename_column :fieldingposts, :DP, :fieldingpost_doubleplay
    rename_column :fieldingposts, :TP, :fieldingpost_tripleplay
    rename_column :fieldingposts, :PB, :fieldingpost_passedballs
    rename_column :fieldingposts, :SB, :fieldingpost_stolenbases
    rename_column :fieldingposts, :CS, :fieldingpost_caughtstealing
  end
end