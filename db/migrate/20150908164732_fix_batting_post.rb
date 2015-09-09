class FixBattingPost < ActiveRecord::Migration
  def change
    execute "ALTER TABLE battingposts DROP CONSTRAINT \"BattingPost_pkey\";"
    add_column :battingposts, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE battingposts ADD PRIMARY KEY (id);"
    add_column :battingposts, :player_id, :uuid
    Battingpost.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :battingposts, :playerID
  end
end
