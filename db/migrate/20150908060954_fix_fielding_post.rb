class FixFieldingPost < ActiveRecord::Migration
  def change
    execute "ALTER TABLE fieldingposts DROP CONSTRAINT \"FieldingPost_pkey\";"
    add_column :fieldingposts, :id, :uuid, first: true, default: 'uuid_generate_v4()'
    execute "ALTER TABLE fieldingposts ADD PRIMARY KEY (id);"
    add_column :fieldingposts, :player_id, :uuid
    Fieldingpost.find_each do |b|
      b.player_id = Player.find_by(legacy_id: b.playerID).id
      b.save!
    end
    remove_column :fieldingposts, :playerID
  end
end
