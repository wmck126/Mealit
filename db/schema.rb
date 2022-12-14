# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_13_224100) do
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "calories"
    t.string "protein"
    t.string "carbs"
    t.string "fat"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "ingredient_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_meals_on_course_id"
    t.index ["ingredient_id"], name: "index_meals_on_ingredient_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.integer "weight"
    t.integer "height"
    t.integer "carb_goal"
    t.integer "protein_goal"
    t.integer "fat_goal"
    t.float "activity_level"
    t.float "bmi"
    t.integer "weight_goal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_meals", force: :cascade do |t|
    t.integer "users_id"
    t.integer "meals_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meals_id"], name: "index_user_meals_on_meals_id"
    t.index ["users_id"], name: "index_user_meals_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meals", "courses"
  add_foreign_key "meals", "ingredients"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_meals", "meals", column: "meals_id"
  add_foreign_key "user_meals", "users", column: "users_id"
end
