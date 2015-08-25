class FixFielding < ActiveRecord::Migration
  def change
    execute "ALTER TABLE fieldings DROP CONSTRAINT \"Fielding_pkey\";"
    add_column :fieldings, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE fieldings ADD PRIMARY KEY (id);"
    add_column :fieldings, :player_id, :uuid
    Fielding.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :fieldings, :playerID
  end
end
