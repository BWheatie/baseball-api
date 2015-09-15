class AddIndexToBattingsTable < ActiveRecord::Migration
  def change
    add_index(:battings, :player_id)
  end
end
