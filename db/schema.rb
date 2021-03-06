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

ActiveRecord::Schema.define(version: 20160524031441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "AwardsShareManagers", id: false, force: :cascade do |t|
    t.string  "awardID",    limit: 50, default: "", null: false
    t.integer "yearID",                default: 0,  null: false
    t.string  "lgID",       limit: 4,  default: "", null: false
    t.string  "playerID",   limit: 20, default: "", null: false
    t.integer "pointsWon"
    t.integer "pointsMax"
    t.integer "votesFirst"
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
    t.integer "yearID",                           default: 0,  null: false
    t.string  "teamID",                 limit: 6, default: "", null: false
    t.string  "lgID",                   limit: 4
    t.integer "all_games"
    t.integer "games_started"
    t.integer "games_batting"
    t.integer "games_defense"
    t.integer "games_pitched"
    t.integer "games_catcher"
    t.integer "games_firstbase"
    t.integer "games_secondbase"
    t.integer "games_thirdbase"
    t.integer "games_shortstop"
    t.integer "games_leftfield"
    t.integer "games_centerfield"
    t.integer "games_rightfield"
    t.integer "games_outfield"
    t.integer "games_designatedhitter"
    t.integer "games_pinchhitter"
    t.integer "games_pinchrunner"
    t.uuid    "player_id"
  end

  create_table "battingposts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",                                  default: 0,  null: false
    t.string  "round",                        limit: 20, default: "", null: false
    t.string  "teamID",                       limit: 6
    t.string  "lgID",                         limit: 4
    t.integer "battingpost_games"
    t.integer "battingpost_atbats"
    t.integer "battingpost_runs"
    t.integer "battingpost_hits"
    t.integer "battingpost_doubles"
    t.integer "battingpost_triples"
    t.integer "battingpost_homeruns"
    t.integer "battingpost_rbi"
    t.integer "battingpost_stolenbases"
    t.integer "battingpost_caughtstealing"
    t.integer "battingpost_walks"
    t.integer "battingpost_strikeouts"
    t.integer "battingpost_intentionalwalks"
    t.integer "battingpost_hitbypitch"
    t.integer "battingpost_sacbunts"
    t.integer "battingpost_sacflys"
    t.integer "battingpost_gidp"
    t.uuid    "player_id"
  end

  add_index "battingposts", ["player_id"], name: "index_battingposts_on_player_id", using: :btree

  create_table "battings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",                             default: 0, null: false
    t.integer "stint",                              default: 0, null: false
    t.string  "teamID",                   limit: 6
    t.string  "lgID",                     limit: 4
    t.integer "games"
    t.integer "G_batting"
    t.integer "atbats"
    t.integer "batting_runs"
    t.integer "batting_hits"
    t.integer "batting_doubles"
    t.integer "batting_triples"
    t.integer "batting_homeruns"
    t.integer "batting_rbi"
    t.integer "batting_stolenbases"
    t.integer "batting_caughtstealing"
    t.integer "batting_walk"
    t.integer "batting_strikeout"
    t.integer "batting_intentionalwalks"
    t.integer "batting_hitbypitch"
    t.integer "batting_sacbunt"
    t.integer "batting_sacfly"
    t.integer "batting_gidp"
    t.integer "G_old"
    t.uuid    "player_id"
  end

  add_index "battings", ["player_id"], name: "index_battings_on_player_id", using: :btree

  create_table "fieldingofs", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 18, default: "", null: false
    t.integer "yearID",              default: 0,  null: false
    t.integer "stint",               default: 0,  null: false
    t.integer "Glf"
    t.integer "Gcf"
    t.integer "Grf"
  end

  create_table "fieldingposts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",                                 default: 0,  null: false
    t.string  "teamID",                      limit: 6
    t.string  "lgID",                        limit: 4
    t.string  "round",                       limit: 20, default: "", null: false
    t.string  "POS",                         limit: 4,  default: "", null: false
    t.integer "fieldingpost_games"
    t.integer "fieldingpost_gamesstarted"
    t.integer "fieldingpost_innouts"
    t.integer "fieldingpost_putouts"
    t.integer "fieldingpost_assists"
    t.integer "fieldingpost_errors"
    t.integer "fieldingpost_doubleplay"
    t.integer "fieldingpost_tripleplay"
    t.integer "fieldingpost_passedballs"
    t.integer "fieldingpost_stolenbases"
    t.integer "fieldingpost_caughtstealing"
    t.uuid    "player_id"
  end

  add_index "fieldingposts", ["player_id"], name: "index_fieldingposts_on_player_id", using: :btree

  create_table "fieldings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",                            default: 0,  null: false
    t.integer "stint",                             default: 0,  null: false
    t.string  "teamID",                  limit: 6
    t.string  "lgID",                    limit: 4
    t.string  "POS",                     limit: 4, default: "", null: false
    t.integer "fielding_games"
    t.integer "fielding_gamesstarted"
    t.integer "fielding_innouts"
    t.integer "fielding_putouts"
    t.integer "fielding_assists"
    t.integer "fielding_errors"
    t.integer "fielding_doubleplay"
    t.integer "fielding_passedballs"
    t.integer "fielding_wildpitches"
    t.integer "fielding_stolenbases"
    t.integer "fielding_caughtstealing"
    t.float   "fielding_zonerating"
    t.uuid    "player_id"
  end

  add_index "fieldings", ["player_id"], name: "index_fieldings_on_player_id", using: :btree

  create_table "manager_awards", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 20,  default: "", null: false
    t.string  "awardID",  limit: 150, default: "", null: false
    t.integer "yearID",               default: 0,  null: false
    t.string  "lgID",     limit: 4,   default: "", null: false
    t.string  "tie",      limit: 2
    t.string  "notes",    limit: 200
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
    t.integer "yearID",                                   default: 0,  null: false
    t.string  "round",                         limit: 20, default: "", null: false
    t.string  "teamID",                        limit: 6
    t.string  "lgID",                          limit: 4
    t.integer "pitchingpost_wins"
    t.integer "pitchingpost_losses"
    t.integer "pitchingpost_games"
    t.integer "pitchingpost_gamesstarted"
    t.integer "pitchingpost_completegames"
    t.integer "pitchingpost_shutouts"
    t.integer "pitchingpost_saves"
    t.integer "pitchingpost_ipouts"
    t.integer "pitchingpost_hits"
    t.integer "pitchingpost_earnedruns"
    t.integer "pitchingpost_homeruns"
    t.integer "pitchingpost_walks"
    t.integer "pitchingpost_strikeouts"
    t.float   "pitchingpost_baopp"
    t.float   "pitchingpost_era"
    t.integer "pitchingpost_intentionalwalks"
    t.integer "pitchingpost_wildpitches"
    t.integer "pitchingpost_hitbypitch"
    t.integer "pitchingpost_balk"
    t.integer "pitchingpost_battersfaced"
    t.integer "pitchingpost_gamesfinished"
    t.integer "pitchingpost_runs"
    t.integer "pitchingpost_sacbunts"
    t.integer "pitchingpost_sacflys"
    t.integer "pitchingpost_gidp"
    t.uuid    "player_id"
  end

  add_index "pitchingposts", ["player_id"], name: "index_pitchingposts_on_player_id", using: :btree

  create_table "pitchings", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer "yearID",                              default: 0, null: false
    t.integer "stint",                               default: 0, null: false
    t.string  "teamID",                    limit: 6
    t.string  "lgID",                      limit: 4
    t.integer "pitching_wins"
    t.integer "pitching_losses"
    t.integer "pitching_games"
    t.integer "pitching_gamesstarted"
    t.integer "pitching_completegames"
    t.integer "pitching_shutouts"
    t.integer "pitching_saves"
    t.integer "pitching_ipouts"
    t.integer "pitching_hits"
    t.integer "pitching_earnedruns"
    t.integer "pitching_homeruns"
    t.integer "pitching_walks"
    t.integer "pitching_strikeouts"
    t.float   "pitching_baopp"
    t.float   "pitching_era"
    t.integer "pitching_intentionalwalks"
    t.integer "pitching_wildpitches"
    t.integer "pitching_hitbypitch"
    t.integer "pitching_balk"
    t.integer "pitching_battersfaced"
    t.integer "pitching_gamesfinished"
    t.integer "pitching_runs"
    t.integer "pitching_sacbunts"
    t.integer "pitching_sacflys"
    t.integer "pitching_gidp"
    t.uuid    "player_id"
  end

  add_index "pitchings", ["player_id"], name: "index_pitchings_on_player_id", using: :btree

  create_table "player_awards", id: false, force: :cascade do |t|
    t.string  "playerID", limit: 18,  default: "", null: false
    t.string  "awardID",  limit: 510, default: "", null: false
    t.integer "yearID",               default: 0,  null: false
    t.string  "lgID",     limit: 4,   default: "", null: false
    t.string  "tie",      limit: 2
    t.string  "notes",    limit: 200
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

  add_index "players", ["name_first"], name: "index_players_on_name_first", using: :btree
  add_index "players", ["name_given"], name: "index_players_on_name_given", using: :btree
  add_index "players", ["name_last"], name: "index_players_on_name_last", using: :btree

  create_table "shared_player_awards", id: false, force: :cascade do |t|
    t.string  "awardID",    limit: 50, default: "", null: false
    t.integer "yearID",                default: 0,  null: false
    t.string  "lgID",       limit: 4,  default: "", null: false
    t.string  "playerID",   limit: 18, default: "", null: false
    t.float   "pointsWon"
    t.integer "pointsMax"
    t.float   "votesFirst"
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
