class AddIndexToPitchingsTable < ActiveRecord::Migration
  def change
    add_index(:pitchings, :player_id)
  end
end
