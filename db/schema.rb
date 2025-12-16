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

ActiveRecord::Schema[8.1].define(version: 2025_12_16_000001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "attempt_answers", force: :cascade do |t|
    t.text "answer_text"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.bigint "option_id"
    t.bigint "question_id", null: false
    t.bigint "quiz_attempt_id", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_attempt_answers_on_option_id"
    t.index ["question_id"], name: "index_attempt_answers_on_question_id"
    t.index ["quiz_attempt_id"], name: "index_attempt_answers_on_quiz_attempt_id"
  end

  create_table "options", force: :cascade do |t|
    t.text "content"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.string "match_key"
    t.bigint "question_id", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "points"
    t.integer "position"
    t.string "question_type"
    t.bigint "quiz_id", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quiz_attempts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "quiz_id", null: false
    t.decimal "score"
    t.string "session_id"
    t.integer "total_questions"
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_attempts_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "published", default: false
    t.integer "time_per_question", default: 10
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["published"], name: "index_quizzes_on_published"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.string "role", default: "admin"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attempt_answers", "options"
  add_foreign_key "attempt_answers", "questions"
  add_foreign_key "attempt_answers", "quiz_attempts"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quiz_attempts", "quizzes"
  add_foreign_key "quizzes", "users"
end
