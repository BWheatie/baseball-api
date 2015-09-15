class AddIndexToBattingPostsTable < ActiveRecord::Migration
  def change
    add_index(:battingposts, :player_id)
  end
end
