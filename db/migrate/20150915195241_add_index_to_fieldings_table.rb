class AddIndexToFieldingsTable < ActiveRecord::Migration
  def change
    add_index(:fieldings, :player_id)
  end
end
