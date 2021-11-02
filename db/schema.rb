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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_11_11_025628) do
=======
ActiveRecord::Schema.define(version: 2021_10_21_024335) do
>>>>>>> Team_model
=======
ActiveRecord::Schema.define(version: 2021_11_01_015241) do
>>>>>>> team_manager
=======
ActiveRecord::Schema.define(version: 2021_11_02_051517) do
>>>>>>> add_develop_user

  create_table "tasks", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "finish"
    t.date "start_time"
    t.integer "user_id"
    t.integer "team_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
<<<<<<< HEAD
    t.integer "manager_id", default: 1
=======
>>>>>>> Team_model
=======
    t.integer "manager_id", default: 1
>>>>>>> team_manager
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deve_user", default: false, null: false
<<<<<<< HEAD
    t.string "name", default: ""
=======
>>>>>>> add_develop_user
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
