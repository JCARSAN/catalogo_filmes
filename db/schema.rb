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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_164356) do
  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.date "born_date"
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo", default: ""
    t.index ["genre_id"], name: "index_directors_on_genre_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "year_published"
    t.string "synopsis"
    t.string "country"
    t.integer "duration"
    t.integer "director_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster_photo", default: ""
    t.boolean "released", default: false
    t.integer "status", default: 0
    t.index ["director_id"], name: "index_films_on_director_id"
    t.index ["genre_id"], name: "index_films_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "directors", "genres"
  add_foreign_key "films", "directors"
  add_foreign_key "films", "genres"
end
