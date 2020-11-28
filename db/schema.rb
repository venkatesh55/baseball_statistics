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

ActiveRecord::Schema.define(version: 2020_11_28_141917) do

  create_table "divisions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
  end

  create_table "league_participation", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "league_id"
    t.integer "team_id"
    t.integer "player_id"
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "season_id"
    t.string "name"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "surname"
    t.string "given_name"
    t.string "throws"
    t.string "position"
    t.integer "wins"
    t.integer "losses"
    t.integer "saves"
    t.integer "games"
    t.integer "games_started"
    t.integer "complete_games"
    t.integer "shut_outs"
    t.float "era"
    t.float "innings"
    t.integer "at_bats", default: 0
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "hit_batter"
    t.integer "wild_pitches"
    t.integer "balk"
    t.integer "walked_batter"
    t.integer "struck_out_batter"
    t.integer "hits", default: 0
    t.integer "doubles", default: 0
    t.integer "triples", default: 0
    t.integer "home_runs", default: 0
    t.integer "rbi"
    t.integer "steals"
    t.integer "caught_stealing"
    t.integer "sacrifice_hits"
    t.integer "sacrifice_flies", default: 0
    t.integer "errors_count"
    t.integer "pb"
    t.integer "walks", default: 0
    t.integer "struck_out"
    t.integer "hit_by_pitch", default: 0
    t.float "ops", default: 0.0
    t.float "avg", default: 0.0
    t.integer "sb", default: 0
  end

  create_table "seasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "year"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "division_id"
    t.string "city"
    t.string "name"
  end

end
