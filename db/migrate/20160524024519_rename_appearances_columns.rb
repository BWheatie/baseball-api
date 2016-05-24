class RenameAppearancesColumns < ActiveRecord::Migration
  def change
  	change_table :appearances do |t|
  		t.rename :G_all, :all_games
  		t.rename :GS, :games_started
  		t.rename :G_batting, :games_batting
  		t.rename :G_defense, :games_defense
  		t.rename :G_p, :games_pitched
  		t.rename :G_c, :games_catcher
  		t.rename :G_1b, :games_firstbase
  		t.rename :G_2b, :games_secondbase
  		t.rename :G_3b, :games_thirdbase
  		t.rename :G_ss, :games_shortstop
  		t.rename :G_lf, :games_leftfield
  		t.rename :G_cf, :games_centerfield
  		t.rename :G_rf, :games_rightfield
  		t.rename :G_of, :games_outfield
  		t.rename :G_dh, :games_designatedhitter
  		t.rename :G_ph, :games_pinchhitter
  		t.rename :G_pr, :games_pinchrunner
  	end
  end
end
