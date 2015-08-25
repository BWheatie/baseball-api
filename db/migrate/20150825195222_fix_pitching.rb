class FixPitching < ActiveRecord::Migration
  def change
    execute "ALTER TABLE pitchings DROP CONSTRAINT \"Pitching_pkey\";"
    add_column :pitchings, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE pitchings ADD PRIMARY KEY (id);"
    add_column :pitchings, :player_id, :uuid
    Pitching.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :pitchings, :playerID
  end
end
