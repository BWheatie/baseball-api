class RenameAwardsTables < ActiveRecord::Migration
  def change
  	rename_table :AwardsManagers, :manager_awards
  	rename_table :AwardsPlayers, :player_awards
  	rename_table :AwardsSharePlayers, :shared_player_awards
  end
end
