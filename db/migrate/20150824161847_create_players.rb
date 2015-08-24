class CreatePlayers < ActiveRecord::Migration
  class Person < ActiveRecord::Base
    self.table_name = "Master"
    self.primary_key = "playerID"
  end

  def change
    create_table :players, id: :uuid do |t|
      t.string "legacy_id"
      t.integer  "birthYear"
      t.integer  "birthMonth"
      t.integer  "birthDay"
      t.string   "birthCountry"
      t.string   "birthState"
      t.string   "birthCity"
      t.integer  "deathYear"
      t.integer  "deathMonth"
      t.integer  "deathDay"
      t.string   "deathCountry"
      t.string   "deathState"
      t.string   "deathCity"
      t.string   "nameFirst"
      t.string   "nameLast"
      t.string   "nameGiven"
      t.integer  "weight"
      t.float    "height"
      t.string   "bats"
      t.string   "throws"
      t.datetime "debut"
      t.datetime "finalGame"
    end
    Person.find_each do |p|
      hash = p.attributes
      hash["legacy_id"] = hash["playerID"]
      hash.delete("playerID")
      hash.delete("retroID")
      hash.delete("bbrefID")
      Player.create!(hash)
    end
  end
end
