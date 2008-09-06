# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 10) do

  create_table "game_data", :force => true do |t|
    t.integer  "game_id"
    t.integer  "format"
    t.string   "charset"
    t.integer  "option"
    t.text     "data"
    t.string   "path"
    t.string   "url"
    t.boolean  "is_commented"
    t.string   "commented_by"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "game_type"
    t.integer  "status"
    t.integer  "rule"
    t.integer  "board_size"
    t.integer  "handicap"
    t.integer  "first_color"
    t.float    "komi"
    t.integer  "result"
    t.integer  "winner"
    t.integer  "moves"
    t.float    "win_points"
    t.string   "name"
    t.string   "event"
    t.string   "place"
    t.string   "source"
    t.datetime "played_at"
    t.boolean  "is_online_game"
    t.integer  "platform_id"
    t.text     "description"
    t.integer  "black_id"
    t.integer  "white_id"
    t.string   "black_name"
    t.string   "black_rank"
    t.string   "white_name"
    t.string   "white_rank"
    t.integer  "game_data_id"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gaming_platforms", :force => true do |t|
    t.integer  "nation_area_id"
    t.string   "name"
    t.string   "url"
    t.boolean  "is_turn_based"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nation_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "online_players", :force => true do |t|
    t.integer  "player_id"
    t.integer  "gaming_platform_id"
    t.string   "username"
    t.date     "registered_at"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "nation_area_id"
    t.string   "username"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "chinese_name"
    t.string   "pinyin_name"
    t.string   "other_names"
    t.boolean  "is_amateur"
    t.string   "rank"
    t.integer  "sex"
    t.integer  "birth_year"
    t.date     "birthday"
    t.string   "province_state"
    t.string   "city"
    t.string   "website"
    t.string   "email"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_games", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "game_id"
    t.integer  "status"
    t.string   "result"
    t.text     "description"
    t.integer  "black_id"
    t.integer  "white_id"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_players", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.integer  "result_id"
    t.boolean  "is_seed_player"
    t.boolean  "passed"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_result_types", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.text     "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", :force => true do |t|
    t.integer  "parent_id"
    t.boolean  "is_series"
    t.boolean  "is_primary"
    t.string   "name"
    t.string   "organizer"
    t.text     "description"
    t.string   "stage"
    t.boolean  "has_sub_tournaments"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
