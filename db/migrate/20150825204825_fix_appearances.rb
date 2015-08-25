class FixAppearances < ActiveRecord::Migration
  def change
    execute "ALTER TABLE appearances DROP CONSTRAINT \"Appearances_pkey\";"
    add_column :appearances, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE appearances ADD PRIMARY KEY (id);"
    add_column :appearances, :player_id, :uuid
    Appearance.find_each do |b|
      player = Player.find_by(legacy_id: b.playerID)
      unless player
        b.destroy!
        next
      end
      b.player_id = player.id
      b.save!
    end
    remove_column :appearances, :playerID
  end
end
