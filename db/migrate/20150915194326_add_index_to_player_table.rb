class AddIndexToPlayerTable < ActiveRecord::Migration
  def change
    add_index(:players, :name_first)
    add_index(:players, :name_last)
    add_index(:players, :name_given)
  end
end
