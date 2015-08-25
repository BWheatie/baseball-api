class CreateAppearences < ActiveRecord::Migration
  def change
    create_table :appearences do |t|

      t.timestamps null: false
    end
  end
end
