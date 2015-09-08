class ChangePostTableNames < ActiveRecord::Migration
  def change
    rename_table :BattingPost, :battingposts
    rename_table :PitchingPost, :pitchingposts
    rename_table :FieldingPost, :fieldingposts
    rename_table :FieldingOF, :fieldingofs
  end
end
