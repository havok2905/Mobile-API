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

ActiveRecord::Schema.define(version: 20140717032948) do

  create_table "checkpoint_associations", force: true do |t|
    t.integer  "followed"
    t.datetime "last_visited"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkpoint_associations_checkpoints", force: true do |t|
    t.integer "checkpoint_id"
    t.integer "checkpoint_association_id"
  end

  create_table "checkpoint_associations_conditions", force: true do |t|
    t.integer "checkpoint_association_id"
    t.integer "checkpoint_condition_id"
  end

  create_table "checkpoint_conditions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "achieved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkpoint_conditions_checkpoints", force: true do |t|
    t.integer "checkpoint_id"
    t.integer "checkpoint_condition_id"
  end

  create_table "checkpoints", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.text     "description"
    t.integer  "followed"
    t.datetime "last_visited"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkpoints", ["game_id"], name: "index_checkpoints_on_game_id"

  create_table "effects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "media_path"
    t.string   "effect_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "effects_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "effect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "effects_items", ["effect_id"], name: "index_effects_items_on_effect_id"
  add_index "effects_items", ["item_id"], name: "index_effects_items_on_item_id"

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "health_items", force: true do |t|
    t.integer "boost"
    t.boolean "can_self"
    t.boolean "can_target"
    t.integer "limit"
    t.integer "item_id"
  end

  add_index "health_items", ["item_id"], name: "index_health_items_on_item_id"

  create_table "inventories", force: true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventories", ["game_id"], name: "index_inventories_on_game_id"

  create_table "inventory_items", force: true do |t|
    t.integer  "inventory_id"
    t.integer  "item_id"
    t.string   "item_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventory_items", ["inventory_id"], name: "index_inventory_items_on_inventory_id"
  add_index "inventory_items", ["item_id"], name: "index_inventory_items_on_item_id"

  create_table "items", force: true do |t|
    t.integer  "as_item_id"
    t.string   "as_item_type"
    t.string   "name"
    t.string   "description"
    t.string   "media_path"
    t.string   "type"
    t.integer  "checkpoint_id"
    t.integer  "checkpoint_association_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["checkpoint_association_id"], name: "index_items_on_checkpoint_association_id"
  add_index "items", ["checkpoint_id"], name: "index_items_on_checkpoint_id"

  create_table "stories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "media_type"
    t.string   "media_path"
    t.integer  "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["condition_id"], name: "index_stories_on_condition_id"

  create_table "story_items", force: true do |t|
    t.boolean "priority"
    t.integer "item_id"
  end

  add_index "story_items", ["item_id"], name: "index_story_items_on_item_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_items", force: true do |t|
    t.integer "damage"
    t.boolean "splash"
    t.boolean "radius"
    t.integer "integrity"
    t.boolean "timed"
    t.integer "time"
    t.integer "item_id"
  end

  add_index "weapon_items", ["item_id"], name: "index_weapon_items_on_item_id"

end
