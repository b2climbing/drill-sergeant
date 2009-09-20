# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090919211851) do

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sequence_exercises", :force => true do |t|
    t.integer "sequence_id"
    t.integer "exercise_id"
    t.integer "exercise_order"
    t.integer "repetitions"
    t.integer "time"
  end

  create_table "sequences", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.integer  "time_between_exercises"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
