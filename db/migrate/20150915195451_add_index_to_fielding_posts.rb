class AddIndexToFieldingPosts < ActiveRecord::Migration
  def change
    add_index(:fieldingposts, :player_id)
  end
end
