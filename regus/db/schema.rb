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

ActiveRecord::Schema.define(version: 20161119225320) do

  create_table "all_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "subcontractor_id"
    t.integer  "jobsite_id"
    t.integer  "company_contact_id"
    t.integer  "subcontractor_contact_id"
    t.integer  "jobsite_contact_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "jobs", ["company_contact_id"], name: "index_jobs_on_company_contact_id"
  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id"
  add_index "jobs", ["jobsite_id"], name: "index_jobs_on_jobsite_id"
  add_index "jobs", ["subcontractor_contact_id"], name: "index_jobs_on_subcontractor_contact_id"
  add_index "jobs", ["subcontractor_id"], name: "index_jobs_on_subcontractor_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "jobsite_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobsites", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "full_address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lead_report_negatives", force: :cascade do |t|
    t.string   "purpose"
    t.string   "analytics"
    t.string   "results"
    t.string   "assumptions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lead_report_negs", force: :cascade do |t|
    t.datetime "date"
    t.string   "company"
    t.string   "contact"
    t.string   "address"
    t.string   "service"
    t.string   "instrument"
    t.string   "jobsite_name"
    t.string   "jobsite_addr"
    t.string   "consultant"
    t.string   "purpose"
    t.string   "analytics"
    t.string   "results"
    t.string   "assumptions"
    t.string   "cac"
    t.string   "cdph"
    t.string   "nv"
    t.integer  "xrf_coc_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "lead_report_negs", ["xrf_coc_id"], name: "index_lead_report_negs_on_xrf_coc_id"

  create_table "lead_report_positives", force: :cascade do |t|
    t.string   "purpose"
    t.string   "analytics"
    t.string   "results"
    t.string   "recommendations"
    t.string   "assumptions"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lead_reports", force: :cascade do |t|
    t.datetime "date"
    t.string   "company"
    t.string   "contact"
    t.string   "address"
    t.string   "service"
    t.string   "instrument"
    t.string   "jobsite_name"
    t.string   "jobsite_addr"
    t.string   "consultant"
    t.string   "purpose"
    t.string   "analytics"
    t.string   "results"
    t.string   "recommendations"
    t.string   "assumptions"
    t.string   "cac"
    t.string   "cdph"
    t.string   "nv"
    t.integer  "xrf_coc_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "lead_reports", ["xrf_coc_id"], name: "index_lead_reports_on_xrf_coc_id"

  create_table "mycometer_coc_samples", force: :cascade do |t|
    t.string   "sample_num"
    t.string   "location"
    t.integer  "bv1"
    t.integer  "bv2"
    t.decimal  "cv"
    t.integer  "av"
    t.decimal  "bsv"
    t.string   "result"
    t.integer  "mycometer_coc_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "mycometer_coc_samples", ["mycometer_coc_id"], name: "index_mycometer_coc_samples_on_mycometer_coc_id"

  create_table "mycometer_cocs", force: :cascade do |t|
    t.datetime "date"
    t.string   "turnaround"
    t.string   "mold_air"
    t.string   "building_type"
    t.string   "sampling_method"
    t.string   "test_unit"
    t.integer  "ambient_temp"
    t.string   "reaction_time"
    t.integer  "liters_minute"
    t.string   "duration"
    t.string   "job_type"
    t.string   "cli_type"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "mycometer_cocs", ["job_id"], name: "index_mycometer_cocs_on_job_id"
  add_index "mycometer_cocs", ["user_id"], name: "index_mycometer_cocs_on_user_id"

  create_table "spore_type_counts", force: :cascade do |t|
    t.string   "agrocybe"
    t.string   "alternaria"
    t.string   "ascospores"
    t.string   "aspergillus"
    t.string   "aureobasidium"
    t.string   "basidiospores"
    t.string   "bipolaris"
    t.string   "botrytis"
    t.string   "chaetomium"
    t.string   "cercospora"
    t.string   "cladosporium"
    t.string   "curvularia"
    t.string   "epicoccum"
    t.string   "fusarium"
    t.string   "myxomycetes"
    t.string   "nigrospora"
    t.string   "oidium"
    t.string   "pithomyces"
    t.string   "pollen"
    t.string   "rust"
    t.string   "spegazzina"
    t.string   "stachybotrys"
    t.string   "torula"
    t.string   "tetraploa"
    t.string   "ulocladium"
    t.string   "unidentifiable"
    t.string   "fibrous"
    t.string   "hyphal"
    t.string   "insect"
    t.integer  "tape_bulk_coc_sample_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "spore_type_counts", ["tape_bulk_coc_sample_id"], name: "index_spore_type_counts_on_tape_bulk_coc_sample_id"

  create_table "subcontractor_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcontractors", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tape_bulk_coc_samples", force: :cascade do |t|
    t.string   "sample_num"
    t.string   "location"
    t.string   "collection_type"
    t.integer  "tape_bulk_coc_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "tape_bulk_coc_samples", ["tape_bulk_coc_id"], name: "index_tape_bulk_coc_samples_on_tape_bulk_coc_id"

  create_table "tape_bulk_cocs", force: :cascade do |t|
    t.datetime "date"
    t.string   "turnaround"
    t.string   "job_type"
    t.string   "cli_type"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tape_bulk_cocs", ["job_id"], name: "index_tape_bulk_cocs_on_job_id"
  add_index "tape_bulk_cocs", ["user_id"], name: "index_tape_bulk_cocs_on_user_id"

  create_table "turn_around_times", force: :cascade do |t|
    t.string   "turntime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname",                  default: "",    null: false
    t.string   "lname",                  default: "",    null: false
    t.string   "username",               default: "",    null: false
    t.string   "phone",                  default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "rgroup",                 default: false, null: false
    t.boolean  "rlab",                   default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "xrf_coc_samples", force: :cascade do |t|
    t.string   "sample_num"
    t.string   "location"
    t.string   "material"
    t.string   "color"
    t.string   "condition"
    t.string   "reading"
    t.string   "category"
    t.integer  "xrf_coc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "xrf_coc_samples", ["xrf_coc_id"], name: "index_xrf_coc_samples_on_xrf_coc_id"

  create_table "xrf_cocs", force: :cascade do |t|
    t.datetime "date"
    t.string   "turnaround"
    t.string   "xrfunit"
    t.string   "xrfmode"
    t.string   "actionlevel"
    t.string   "abatementlevel"
    t.string   "job_type"
    t.string   "cli_type"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "xrf_cocs", ["job_id"], name: "index_xrf_cocs_on_job_id"
  add_index "xrf_cocs", ["user_id"], name: "index_xrf_cocs_on_user_id"

end
