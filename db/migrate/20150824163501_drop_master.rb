class DropMaster < ActiveRecord::Migration
  def change
    drop_table :Master
  end
end
