class AddIndexToPitchingPostsTable < ActiveRecord::Migration
  def change
    add_index(:pitchingposts, :player_id)
  end
end
