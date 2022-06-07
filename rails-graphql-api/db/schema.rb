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

ActiveRecord::Schema.define(version: 2022_06_07_084431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", comment: "プロジェクトのインタビューを管理するテーブル", force: :cascade do |t|
    t.bigint "project_id", null: false, comment: "プロジェクトID"
    t.date "recorded_on", null: false, comment: "面談日"
    t.datetime "started_at", null: false, comment: "開始時間"
    t.datetime "end_at", comment: "終了時間"
    t.string "location_url", null: false, comment: "面談場所URL"
    t.string "interviewer_name", null: false, comment: "面談相手の名前"
    t.string "interviewer_tel", comment: "面談相手の電話番号"
    t.integer "status", default: 1, comment: "ステータス"
    t.boolean "complete_flag", default: false, null: false, comment: "公開フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_interviews_on_project_id"
  end

  create_table "projects", comment: "プロジェクトを管理するテーブル", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "name", null: false, comment: "案件名"
    t.text "message", null: false, comment: "概要"
    t.string "agent", null: false, comment: "エージェント"
    t.integer "unit_price", comment: "単価"
    t.datetime "start_at", null: false, comment: "活動開始日"
    t.datetime "end_at", comment: "活動終了日"
    t.integer "status", default: 1, null: false, comment: "ステータス"
    t.boolean "public_flag", default: false, null: false, comment: "公開フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "questions", comment: "プロジェクトのインタビューでの質問を管理するテーブル", force: :cascade do |t|
    t.bigint "interview_id", null: false, comment: "インタビューID"
    t.text "question_text", null: false, comment: "質問内容"
    t.text "answer_text", null: false, comment: "回答内容"
    t.integer "reaction", comment: "反応"
    t.boolean "complete_flag", default: false, null: false, comment: "公開フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_questions_on_interview_id"
  end

  create_table "todos", comment: "プロジェクトのTODOを管理するテーブル", force: :cascade do |t|
    t.bigint "project_id", null: false, comment: "プロジェクトID"
    t.string "todo_text", null: false, comment: "TODO内容"
    t.text "note", comment: "詳細"
    t.datetime "time_limit", null: false, comment: "期限日"
    t.boolean "complete_flag", default: false, null: false, comment: "完了フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_todos_on_project_id"
  end

  create_table "user_projects", comment: "ユーザーの参画プロジェクトを管理するテーブル", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "project_id", null: false, comment: "プロジェクトID"
    t.datetime "started_at", null: false, comment: "開始日"
    t.datetime "end_at", comment: "終了日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", comment: "ユーザーを管理するテーブル", force: :cascade do |t|
    t.string "nickname", null: false, comment: "ニックネーム"
    t.string "uuid", null: false, comment: "UUID"
    t.datetime "signup_at", null: false, comment: "サインアップ日"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "interviews", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "questions", "interviews"
  add_foreign_key "todos", "projects"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
end
