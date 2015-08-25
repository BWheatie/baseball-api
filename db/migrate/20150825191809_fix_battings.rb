class FixBattings < ActiveRecord::Migration
  def change
    execute "ALTER TABLE battings DROP CONSTRAINT \"Batting_pkey\";"
    add_column :battings, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE battings ADD PRIMARY KEY (id);"
    add_column :battings, :player_id, :uuid
    Batting.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :battings, :playerID
  end
end
