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

ActiveRecord::Schema.define(version: 20150609165215) do

  create_table "courses", force: :cascade do |t|
    t.string  "acronym"
    t.date    "exam_date"
    t.integer "credits"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "percentage"
    t.integer "student_id"
    t.integer "course_id"
  end

  add_index "grades", ["course_id"], name: "index_grades_on_course_id"
  add_index "grades", ["student_id"], name: "index_grades_on_student_id"

  create_table "students", force: :cascade do |t|
    t.integer "year"
  end

end
