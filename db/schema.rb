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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130727200811) do

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "challenges", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "code"
    t.text     "test_code"
    t.boolean  "private",     :default => true
    t.integer  "company_id"
    t.integer  "author_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "covered_topics", :force => true do |t|
    t.integer "topic_id"
    t.integer "candidate_id"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.integer  "company_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "feedback_questions", :force => true do |t|
    t.string  "prompt"
    t.integer "question_id"
    t.string  "question_type"
  end

  create_table "feedback_responses", :force => true do |t|
    t.integer "feedback_question_id"
    t.integer "employee_id"
    t.integer "candidate_id"
    t.text    "response"
  end

  create_table "given_challenges", :force => true do |t|
    t.integer "challenge_id"
    t.integer "candidate_id"
    t.integer "interview_id"
  end

  create_table "interviews", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "candidate_id"
    t.boolean  "complete",       :default => false
    t.datetime "start"
    t.string   "identifier"
    t.boolean  "recommend_hire"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
