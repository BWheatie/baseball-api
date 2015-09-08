# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150908060954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "AwardsManagers", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 20,  default: "", null: false
    t.string  "awardID",  limit: 150, default: "", null: false
    t.integer "yearID",               default: 0,  null: false
    t.string  "lgID",     limit: 4,   default: "", null: false
    t.string  "tie",      limit: 2
    t.string  "notes",    limit: 200
  end

  create_table "AwardsPlayers", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 18,  default: "", null: false
    t.string  "awardID",  limit: 510, default: "", null: false
    t.integer "yearID",               default: 0,  null: false
    t.string  "lgID",     limit: 4,   default: "", null: false
    t.string  "tie",      limit: 2
    t.string  "notes",    limit: 200
  end

  create_table "AwardsShareManagers", id: false, force: :cascade do |t|
    t.string  "awardID",    limit: 50, default: "", null: false
    t.integer "yearID",                default: 0,  null: false
    t.string  "lgID",       limit: 4,  default: "", null: false
    t.string  "playerID",   limit: 20, default: "", null: false
    t.integer "pointsWon"
    t.integer "pointsMax"
    t.integer "votesFirst"
  end

  create_table "AwardsSharePlayers", id: false, force: :cascade do |t|
    t.string  "awardID",    limit: 50, default: "", null: false
    t.integer "yearID",                default: 0,  null: false
    t.string  "lgID",       limit: 4,  default: "", null: false
    t.string  "playerID",   limit: 18, default: "", null: false
    t.float   "pointsWon"
    t.integer "pointsMax"
    t.float   "votesFirst"
  end

  create_table "CollegePlaying", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 18
    t.string  "schoolID", limit: 30
    t.integer "yearID"
  end

  create_table "HallOfFame", id: false, force: :cascade do |t|
    t.string  "playerID",    limit: 20,  default: "", null: false
    t.integer "yearid",                  default: 0,  null: false
    t.string  "votedBy",     limit: 128, default: "", null: false
    t.integer "ballots"
    t.integer "needed"
    t.integer "votes"
    t.string  "inducted",    limit: 2
    t.string  "category",    limit: 40
    t.string  "needed_note", limit: 50
  end

  create_table "ManagersHalf", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 20, default: "", null: false
    t.integer "yearID",              default: 0,  null: false
    t.string  "teamID",   limit: 6,  default: "", null: false
    t.string  "lgID",     limit: 4
    t.integer "inseason"
    t.integer "half",                default: 0,  null: false
    t.integer "G"
    t.integer "W"
    t.integer "L"
    t.integer "rank"
  end

  create_table "Salaries", id: false, force: :cascade do |t|
    t.integer "yearID",              default: 0,  null: false
    t.string  "teamID",   limit: 6,  default: "", null: false
    t.string  "lgID",     limit: 4,  default: "", null: false
    t.string  "playerID", limit: 18, default: "", null: false
    t.float   "salary"
  end

  create_table "Schools", primary_key: "schoolID", force: :cascade do |t|
    t.string "name_full", limit: 510
    t.string "city",      limit: 110
    t.string "state",     limit: 110
    t.string "country",   limit: 110
  end

  create_table "SeriesPost", id: false, force: :cascade do |t|
    t.integer "yearID",                  default: 0,  null: false
    t.string  "round",        limit: 10, default: "", null: false
    t.string  "teamIDwinner", limit: 6
    t.string  "lgIDwinner",   limit: 4
    t.string  "teamIDloser",  limit: 6
    t.string  "lgIDloser",    limit: 4
    t.integer "wins"
    t.integer "losses"
    t.integer "ties"
  end

  create_table "TeamsFranchises", primary_key: "franchID", force: :cascade do |t|
    t.string "franchName", limit: 100
    t.string "active",     limit: 4
    t.string "NAassoc",    limit: 6
  end

  create_table "TeamsHalf", id: false, force: :cascade do |t|
    t.integer "yearID",           default: 0,  null: false
    t.string  "lgID",   limit: 4, default: "", null: false
    t.string  "teamID", limit: 6, default: "", null: false
    t.string  "Half",   limit: 2, default: "", null: false
    t.string  "divID",  limit: 2
    t.string  "DivWin", limit: 2
    t.integer "Rank"
    t.integer "G"
    t.integer "W"
    t.integer "L"
  end

  create_table "allstars", id: false, force: :cascade do |t|
    t.string  "playerID",    limit: 18, default: "", null: false
    t.integer "yearID",                 default: 0,  null: false
    t.integer "gameNum",                default: 0,  null: false
    t.string  "gameID",      limit: 24
    t.string  "teamID",      limit: 6
    t.string  "lgID",        limit: 4
    t.integer "GP"
    t.integer "startingPos"
  end

  create_table "appearances", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",              default: 0,  null: false
    t.string  "teamID",    limit: 6, default: "", null: false
    t.string  "lgID",      limit: 4
    t.integer "G_all"
    t.integer "GS"
    t.integer "G_batting"
    t.integer "G_defense"
    t.integer "G_p"
    t.integer "G_c"
    t.integer "G_1b"
    t.integer "G_2b"
    t.integer "G_3b"
    t.integer "G_ss"
    t.integer "G_lf"
    t.integer "G_cf"
    t.integer "G_rf"
    t.integer "G_of"
    t.integer "G_dh"
    t.integer "G_ph"
    t.integer "G_pr"
    t.uuid    "player_id"
  end

  create_table "appearences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battingposts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",               default: 0,  null: false
    t.string  "round",     limit: 20, default: "", null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.integer "G"
    t.integer "AB"
    t.integer "R"
    t.integer "H"
    t.integer "2B"
    t.integer "3B"
    t.integer "HR"
    t.integer "RBI"
    t.integer "SB"
    t.integer "CS"
    t.integer "BB"
    t.integer "SO"
    t.integer "IBB"
    t.integer "HBP"
    t.integer "SH"
    t.integer "SF"
    t.integer "GIDP"
    t.uuid    "player_id"
  end

  create_table "battings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",              default: 0, null: false
    t.integer "stint",               default: 0, null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.integer "G"
    t.integer "G_batting"
    t.integer "AB"
    t.integer "R"
    t.integer "H"
    t.integer "2B"
    t.integer "3B"
    t.integer "HR"
    t.integer "RBI"
    t.integer "SB"
    t.integer "CS"
    t.integer "BB"
    t.integer "SO"
    t.integer "IBB"
    t.integer "HBP"
    t.integer "SH"
    t.integer "SF"
    t.integer "GIDP"
    t.integer "G_old"
    t.uuid    "player_id"
  end

  create_table "fieldingofs", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 18, default: "", null: false
    t.integer "yearID",              default: 0,  null: false
    t.integer "stint",               default: 0,  null: false
    t.integer "Glf"
    t.integer "Gcf"
    t.integer "Grf"
  end

  create_table "fieldingposts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",               default: 0,  null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.string  "round",     limit: 20, default: "", null: false
    t.string  "POS",       limit: 4,  default: "", null: false
    t.integer "G"
    t.integer "GS"
    t.integer "InnOuts"
    t.integer "PO"
    t.integer "A"
    t.integer "E"
    t.integer "DP"
    t.integer "TP"
    t.integer "PB"
    t.integer "SB"
    t.integer "CS"
    t.uuid    "player_id"
  end

  create_table "fieldings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",              default: 0,  null: false
    t.integer "stint",               default: 0,  null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.string  "POS",       limit: 4, default: "", null: false
    t.integer "G"
    t.integer "GS"
    t.integer "InnOuts"
    t.integer "PO"
    t.integer "A"
    t.integer "E"
    t.integer "DP"
    t.integer "PB"
    t.integer "WP"
    t.integer "SB"
    t.integer "CS"
    t.float   "ZR"
    t.uuid    "player_id"
  end

  create_table "managers", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 20
    t.integer "yearID",              default: 0,  null: false
    t.string  "teamID",   limit: 6,  default: "", null: false
    t.string  "lgID",     limit: 4
    t.integer "inseason",            default: 0,  null: false
    t.integer "G"
    t.integer "W"
    t.integer "L"
    t.integer "rank"
    t.string  "plyrMgr",  limit: 2
  end

  create_table "pitchingposts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",               default: 0,  null: false
    t.string  "round",     limit: 20, default: "", null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.integer "W"
    t.integer "L"
    t.integer "G"
    t.integer "GS"
    t.integer "CG"
    t.integer "SHO"
    t.integer "SV"
    t.integer "IPouts"
    t.integer "H"
    t.integer "ER"
    t.integer "HR"
    t.integer "BB"
    t.integer "SO"
    t.float   "BAOpp"
    t.float   "ERA"
    t.integer "IBB"
    t.integer "WP"
    t.integer "HBP"
    t.integer "BK"
    t.integer "BFP"
    t.integer "GF"
    t.integer "R"
    t.integer "SH"
    t.integer "SF"
    t.integer "GIDP"
    t.uuid    "player_id"
  end

  create_table "pitchings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",              default: 0, null: false
    t.integer "stint",               default: 0, null: false
    t.string  "teamID",    limit: 6
    t.string  "lgID",      limit: 4
    t.integer "W"
    t.integer "L"
    t.integer "G"
    t.integer "GS"
    t.integer "CG"
    t.integer "SHO"
    t.integer "SV"
    t.integer "IPouts"
    t.integer "H"
    t.integer "ER"
    t.integer "HR"
    t.integer "BB"
    t.integer "SO"
    t.float   "BAOpp"
    t.float   "ERA"
    t.integer "IBB"
    t.integer "WP"
    t.integer "HBP"
    t.integer "BK"
    t.integer "BFP"
    t.integer "GF"
    t.integer "R"
    t.integer "SH"
    t.integer "SF"
    t.integer "GIDP"
    t.uuid    "player_id"
  end

  create_table "players", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "legacy_id"
    t.integer  "birth_year"
    t.integer  "birth_month"
    t.integer  "birth_day"
    t.string   "birth_country"
    t.string   "birth_state"
    t.string   "birth_city"
    t.integer  "death_year"
    t.integer  "death_month"
    t.integer  "death_day"
    t.string   "death_country"
    t.string   "death_state"
    t.string   "death_city"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "name_given"
    t.integer  "weight"
    t.float    "height"
    t.string   "bats"
    t.string   "throws"
    t.datetime "debut"
    t.datetime "final_game"
  end

  create_table "teams", id: false, force: :cascade do |t|
    t.integer "yearID",                     default: 0,  null: false
    t.string  "lgID",           limit: 4,   default: "", null: false
    t.string  "teamID",         limit: 6,   default: "", null: false
    t.string  "franchID",       limit: 6
    t.string  "divID",          limit: 2
    t.integer "Rank"
    t.integer "G"
    t.integer "Ghome"
    t.integer "W"
    t.integer "L"
    t.string  "DivWin",         limit: 2
    t.string  "WCWin",          limit: 2
    t.string  "LgWin",          limit: 2
    t.string  "WSWin",          limit: 2
    t.integer "R"
    t.integer "AB"
    t.integer "H"
    t.integer "2B"
    t.integer "3B"
    t.integer "HR"
    t.integer "BB"
    t.integer "SO"
    t.integer "SB"
    t.integer "CS"
    t.integer "HBP"
    t.integer "SF"
    t.integer "RA"
    t.integer "ER"
    t.float   "ERA"
    t.integer "CG"
    t.integer "SHO"
    t.integer "SV"
    t.integer "IPouts"
    t.integer "HA"
    t.integer "HRA"
    t.integer "BBA"
    t.integer "SOA"
    t.integer "E"
    t.integer "DP"
    t.float   "FP"
    t.string  "name",           limit: 100
    t.string  "park",           limit: 510
    t.integer "attendance"
    t.integer "BPF"
    t.integer "PPF"
    t.string  "teamIDBR",       limit: 6
    t.string  "teamIDlahman45", limit: 6
    t.string  "teamIDretro",    limit: 6
  end

end
