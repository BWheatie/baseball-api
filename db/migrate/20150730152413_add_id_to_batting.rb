class AddIdToBatting < ActiveRecord::Migration
  def change
    change_table :Batting do |t|
        t.uuid :id, default: 'uuid_generate_v4()', first: true, index: true
    end
  end
end
