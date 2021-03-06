# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_13_004207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", force: :cascade do |t|
    t.datetime "creationdate"
    t.string "companyname", default: "", null: false
    t.string "companycontactfullname", default: "", null: false
    t.string "companycontactemail", default: "", null: false
    t.integer "nbelevators", default: 0, null: false
    t.string "customercity", default: "", null: false
  end

  create_table "factcontact", force: :cascade do |t|
    t.integer "contactid", default: 0, null: false
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "projectname", default: "", null: false
  end

  create_table "factelevator", force: :cascade do |t|
    t.string "serialnumber", default: "", null: false
    t.datetime "commissioningdate"
    t.bigint "buildingid", default: 0, null: false
    t.bigint "customerid", default: 0, null: false
    t.string "buildingcity", default: "", null: false
  end

  create_table "factquotes", force: :cascade do |t|
    t.integer "quoteid", default: 0, null: false
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "nbelevator", default: 0, null: false
  end

end
