class FixPitchingPost < ActiveRecord::Migration
  def change
    execute "ALTER TABLE pitchingposts DROP CONSTRAINT \"PitchingPost_pkey\";"
    add_column :pitchingposts, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE pitchingposts ADD PRIMARY KEY (id);"
    add_column :pitchingposts, :player_id, :uuid
    Pitchingpost.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :pitchingposts, :playerID
  end
end
