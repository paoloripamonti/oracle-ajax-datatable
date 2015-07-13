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

ActiveRecord::Schema.define(version: 20150712142927) do

  create_table "activities", force: true do |t|
    t.string   "name",        limit: 256
    t.string   "description"
    t.integer  "position",                precision: 38, scale: 0
    t.boolean  "obsolete",                precision: 1,  scale: 0, default: false
    t.string   "code",        limit: 1
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "creator_id",              precision: 38, scale: 0
    t.integer  "updater_id",              precision: 38, scale: 0
  end

  create_table "activities_specific_objs", id: false, force: true do |t|
    t.integer "activity_id",     precision: 38, scale: 0
    t.integer "specific_obj_id", precision: 38, scale: 0
  end

  add_index "activities_specific_objs", ["activity_id", "specific_obj_id"], name: "activities_so_idx"

  create_table "activities_users", id: false, force: true do |t|
    t.integer "activity_id", precision: 38, scale: 0
    t.integer "user_id",     precision: 38, scale: 0
  end

  add_index "activities_users", ["activity_id", "user_id"], name: "activity_users_idx"

  create_table "airs", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 4000
    t.boolean  "obsolete",                 precision: 1, scale: 0, default: false
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "bimonthly_plans", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "closed_at"
    t.datetime "photo_at"
    t.datetime "published_at"
    t.datetime "define_stamp_before"
    t.string   "state",               limit: 16
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "creator_id",                     precision: 38, scale: 0
    t.integer  "updater_id",                     precision: 38, scale: 0
  end

  create_table "bimonthly_plans_specific_objs", force: true do |t|
    t.integer  "bimonthly_plan_id", precision: 38, scale: 0
    t.integer  "specific_obj_id",   precision: 38, scale: 0
    t.integer  "supervisor_id",     precision: 38, scale: 0
    t.boolean  "new_supervisor",    precision: 1,  scale: 0, default: true
    t.datetime "deadline"
  end

  add_index "bimonthly_plans_specific_objs", ["bimonthly_plan_id"], name: "bim_plan_spec_obj1_idx"
  add_index "bimonthly_plans_specific_objs", ["specific_obj_id"], name: "bim_plan_spec_obj2_idx"

  create_table "budget_assign_details", force: true do |t|
    t.integer  "budget_start_id",                 precision: 38, scale: 0
    t.integer  "chapter_id",                      precision: 38, scale: 0
    t.integer  "structure_id",                    precision: 38, scale: 0
    t.integer  "operational_obj_id",              precision: 38, scale: 0
    t.integer  "generic_obj_id",                  precision: 38, scale: 0
    t.string   "description"
    t.string   "value"
    t.string   "mission",            limit: 2000
    t.integer  "creator_id",                      precision: 38, scale: 0
    t.integer  "updater_id",                      precision: 38, scale: 0
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.integer  "unit_id",                         precision: 38, scale: 0
    t.integer  "phase_id",                        precision: 38, scale: 0, default: 1
  end

  create_table "budget_documents", force: true do |t|
    t.string   "phase_id"
    t.binary   "chapter_overview"
    t.binary   "structure_overview"
    t.binary   "director_resume_user"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "budget_histories", force: true do |t|
    t.string   "content"
    t.integer  "user_id",    precision: 38, scale: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "budget_phase_structures", force: true do |t|
    t.integer "structure_id",       precision: 38, scale: 0
    t.integer "budget_phase_id",    precision: 38, scale: 0
    t.integer "action_phase",       precision: 38, scale: 0
    t.boolean "cost_center_locked", precision: 1,  scale: 0
  end

  add_index "budget_phase_structures", ["structure_id", "budget_phase_id"], name: "ifd284a1e4379457df3c73d278b6af", unique: true

  create_table "budget_phase_types", force: true do |t|
    t.string   "description"
    t.boolean  "obsolete",    precision: 1,  scale: 0
    t.integer  "creator_id",  precision: 38, scale: 0
    t.integer  "updater_id",  precision: 38, scale: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "budget_phases", force: true do |t|
    t.string   "description"
    t.string   "typology"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "current",             precision: 1,  scale: 0
    t.integer  "next_phase",          precision: 38, scale: 0
    t.integer  "prev_phase",          precision: 38, scale: 0
    t.integer  "operational_plan_id", precision: 38, scale: 0
    t.integer  "creator_id",          precision: 38, scale: 0
    t.integer  "updater_id",          precision: 38, scale: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "budget_starts", force: true do |t|
    t.integer  "operational_plan_id",              precision: 38, scale: 0
    t.integer  "chapter_id",                       precision: 38, scale: 0
    t.integer  "structure_id",                     precision: 38, scale: 0
    t.integer  "generic_obj_id",                   precision: 38, scale: 0
    t.string   "value",               limit: 4000
    t.string   "mission",             limit: 2000
    t.integer  "creator_id",                       precision: 38, scale: 0
    t.integer  "updater_id",                       precision: 38, scale: 0
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.boolean  "director_locked",                  precision: 1,  scale: 0, default: false
    t.integer  "phase_id",                         precision: 38, scale: 0, default: 1
  end

  create_table "budgets", force: true do |t|
    t.integer  "structure_id",                     precision: 38, scale: 0
    t.integer  "chapter_id",                       precision: 38, scale: 0
    t.integer  "operational_plan_id",              precision: 38, scale: 0
    t.integer  "generic_obj_id",                   precision: 38, scale: 0
    t.string   "description"
    t.string   "value",               limit: 2047
    t.integer  "budget_start_id",                  precision: 38, scale: 0
    t.integer  "resp_strucutre_id",                precision: 38, scale: 0
    t.string   "supplier"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "code"
    t.integer  "creator_id",                       precision: 38, scale: 0
    t.integer  "updater_id",                       precision: 38, scale: 0
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.integer  "phase_id",                         precision: 38, scale: 0, default: 1
  end

  create_table "chapters", force: true do |t|
    t.integer  "code",        limit: 5,    precision: 5, scale: 0
    t.string   "description", limit: 4000
    t.boolean  "obsolete",                 precision: 1, scale: 0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "abbrev",      limit: 500
  end

  create_table "classification_states", force: true do |t|
    t.integer  "operational_plan_id",  precision: 38, scale: 0
    t.integer  "classification_state", precision: 38, scale: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "date_start"
    t.datetime "date_end"
  end

  create_table "classifications", force: true do |t|
    t.integer  "specific_obj_id",                 precision: 38, scale: 0
    t.integer  "not_applicable",                  precision: 38, scale: 0
    t.string   "typology",           limit: 200
    t.integer  "points",                          precision: 38, scale: 0
    t.integer  "criteria_1",                      precision: 38, scale: 0
    t.integer  "criteria_2",                      precision: 38, scale: 0
    t.integer  "criteria_3",                      precision: 38, scale: 0
    t.integer  "criteria_4",                      precision: 38, scale: 0
    t.string   "note",               limit: 4000
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "creator_id",                      precision: 38, scale: 0
    t.integer  "updater_id",                      precision: 38, scale: 0
    t.integer  "bonus",                           precision: 38, scale: 0, default: 0
    t.integer  "bonus_points",                    precision: 38, scale: 0, default: 0
    t.string   "bonus_note",         limit: 4000
    t.boolean  "bonus_request",                   precision: 1,  scale: 0, default: false
    t.string   "bonus_request_note"
  end

  add_index "classifications", ["specific_obj_id"], name: "class_soid_idx"

  create_table "classifications_structures", id: false, force: true do |t|
    t.integer "structure_id",      precision: 38, scale: 0
    t.integer "classification_id", precision: 38, scale: 0
  end

  add_index "classifications_structures", ["classification_id"], name: "class_idx1"
  add_index "classifications_structures", ["structure_id"], name: "classs_idx2"

  create_table "cost_center_locks", force: true do |t|
    t.integer  "structure_id",        precision: 38, scale: 0
    t.integer  "operational_plan_id", precision: 38, scale: 0
    t.boolean  "lock",                precision: 1,  scale: 0, default: false
    t.string   "step"
    t.datetime "start_at"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  create_table "deadline_histories", force: true do |t|
    t.integer  "specific_obj_id",    precision: 38, scale: 0
    t.datetime "deadline"
    t.integer  "postpone_reason_id", precision: 38, scale: 0
    t.string   "note"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "creator_id",         precision: 38, scale: 0
    t.integer  "updater_id",         precision: 38, scale: 0
  end

  add_index "deadline_histories", ["specific_obj_id", "deadline"], name: "dl_histo_idx"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   precision: 38, scale: 0, default: 0
    t.integer  "attempts",   precision: 38, scale: 0, default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "delete_reasons", force: true do |t|
    t.string   "name"
    t.boolean  "obsolete",             precision: 1,  scale: 0, default: false
    t.string   "scope",      limit: 2,                          default: "so"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "creator_id",           precision: 38, scale: 0
    t.integer  "updater_id",           precision: 38, scale: 0
  end

  add_index "delete_reasons", ["obsolete", "name"], name: "del_reasons_idx"

  create_table "document_versions", force: true do |t|
    t.integer  "document_id",            precision: 38, scale: 0
    t.string   "name"
    t.string   "path"
    t.integer  "version",                precision: 38, scale: 0
    t.integer  "size",                   precision: 38, scale: 0
    t.string   "md5",         limit: 32
    t.string   "file_type",   limit: 64
    t.string   "mime_type",   limit: 64
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "creator_id",             precision: 38, scale: 0
    t.integer  "updater_id",             precision: 38, scale: 0
  end

  add_index "document_versions", ["document_id"], name: "doc_vers_doc_idx"

  create_table "documents", force: true do |t|
    t.integer  "specific_obj_id", precision: 38, scale: 0
    t.string   "name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "documents", ["specific_obj_id"], name: "i_documents_specific_obj_id"

  create_table "generic_objs", force: true do |t|
    t.integer  "parent_id",                           precision: 38, scale: 0
    t.string   "parent_type"
    t.integer  "level",                               precision: 38, scale: 0
    t.string   "code",                   limit: 16
    t.string   "name"
    t.string   "level_name",             limit: 32
    t.integer  "position",                            precision: 38, scale: 0
    t.integer  "operational_plan_id",                 precision: 38, scale: 0
    t.string   "structures_text",        limit: 4000,                          default: ""
    t.boolean  "last_level",                          precision: 1,  scale: 0, default: false
    t.boolean  "include_in_ext_report",               precision: 1,  scale: 0, default: false
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.integer  "creator_id",                          precision: 38, scale: 0
    t.integer  "updater_id",                          precision: 38, scale: 0
    t.boolean  "select_operational_obj",              precision: 1,  scale: 0, default: false
    t.string   "hier_position",          limit: 64
    t.boolean  "selectable_bdg",                      precision: 1,  scale: 0, default: false
    t.boolean  "budget_detail",                       precision: 1,  scale: 0, default: false
  end

  add_index "generic_objs", ["level"], name: "go_lev_idx"
  add_index "generic_objs", ["level_name"], name: "go_lev_name_idx"
  add_index "generic_objs", ["operational_plan_id"], name: "go_sp_idx"
  add_index "generic_objs", ["parent_id", "position"], name: "go_parent_position_idx"
  add_index "generic_objs", ["parent_type"], name: "go_parent_type_idx"

  create_table "generic_objs_operational_objs", id: false, force: true do |t|
    t.integer "operational_obj_id", precision: 38, scale: 0
    t.integer "generic_obj_id",     precision: 38, scale: 0
  end

  add_index "generic_objs_operational_objs", ["generic_obj_id"], name: "go_oo_idx2"
  add_index "generic_objs_operational_objs", ["operational_obj_id"], name: "go_oo_idx1"

  create_table "generic_objs_structures", force: true do |t|
    t.integer "structure_id",             precision: 38, scale: 0
    t.integer "generic_obj_id",           precision: 38, scale: 0
    t.string  "assoc_code",     limit: 1,                          default: "n"
  end

  add_index "generic_objs_structures", ["assoc_code"], name: "go_struct_assoc_code_idx"
  add_index "generic_objs_structures", ["structure_id"], name: "go_struct_str_idx"

  create_table "keywords", force: true do |t|
    t.string   "name",        limit: 128
    t.string   "description", limit: 1024
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "creator_id",               precision: 38, scale: 0
    t.integer  "updater_id",               precision: 38, scale: 0
  end

  add_index "keywords", ["name"], name: "index_keywords_on_name"

  create_table "keywords_specific_objs", id: false, force: true do |t|
    t.integer "keyword_id",      precision: 38, scale: 0
    t.integer "specific_obj_id", precision: 38, scale: 0
  end

  add_index "keywords_specific_objs", ["keyword_id"], name: "keywords_so_kw_idx"
  add_index "keywords_specific_objs", ["specific_obj_id"], name: "keywords_so_so_idx"

  create_table "op_plan_photo_so_types", force: true do |t|
    t.integer "photo_id",   precision: 38, scale: 0
    t.integer "so_type_id", precision: 38, scale: 0
  end

  create_table "op_plan_photos_documents", force: true do |t|
    t.integer  "photo_id",                precision: 38, scale: 0
    t.string   "name"
    t.string   "path"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.boolean  "publish",                 precision: 1,  scale: 0, default: false
    t.string   "note",       limit: 4000
    t.string   "title",      limit: 4000
    t.string   "subtitle",   limit: 4000
    t.string   "intro",      limit: 4000
  end

  create_table "op_plan_photos_gen_objs", force: true do |t|
    t.integer "photo_id",   precision: 38, scale: 0
    t.integer "gen_obj_id", precision: 38, scale: 0
  end

  add_index "op_plan_photos_gen_objs", ["gen_obj_id"], name: "photo_gen_obj_idxb2"
  add_index "op_plan_photos_gen_objs", ["photo_id"], name: "photo_gen_obj_idxb1"

  create_table "op_plan_photos_op_objs", force: true do |t|
    t.integer "photo_id",  precision: 38, scale: 0
    t.integer "op_obj_id", precision: 38, scale: 0
  end

  add_index "op_plan_photos_op_objs", ["op_obj_id"], name: "photo_op_obj_idxb2"
  add_index "op_plan_photos_op_objs", ["photo_id"], name: "photo_op_obj_idxb1"

  create_table "op_plan_photos_structures", force: true do |t|
    t.integer "photo_id",     precision: 38, scale: 0
    t.integer "structure_id", precision: 38, scale: 0
  end

  add_index "op_plan_photos_structures", ["photo_id"], name: "photo_str_idxb1"
  add_index "op_plan_photos_structures", ["structure_id"], name: "photo_str_idxb2"

  create_table "operational_objs", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 511
    t.boolean  "obsolete",                precision: 1,  scale: 0, default: false
    t.integer  "creator_id",              precision: 38, scale: 0
    t.integer  "updater_id",              precision: 38, scale: 0
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "operational_objs_structures", id: false, force: true do |t|
    t.integer "operational_obj_id", precision: 38, scale: 0
    t.integer "structure_id",       precision: 38, scale: 0
  end

  add_index "operational_objs_structures", ["operational_obj_id"], name: "oostr_idx1"
  add_index "operational_objs_structures", ["structure_id"], name: "oostr_idx2"

  create_table "operational_plan_photos", force: true do |t|
    t.integer  "operational_plan_id",              precision: 38, scale: 0
    t.string   "title",                 limit: 64
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.integer  "creator_id",                       precision: 38, scale: 0
    t.integer  "updater_id",                       precision: 38, scale: 0
    t.string   "include_in_ext_report",                                     default: "all"
    t.boolean  "so_deleted",                       precision: 1,  scale: 0, default: true
    t.string   "sort_report",                                               default: "1"
    t.boolean  "view_ob_op",                       precision: 1,  scale: 0, default: true
    t.boolean  "legend",                           precision: 1,  scale: 0, default: false
    t.boolean  "premise",                          precision: 1,  scale: 0, default: true
    t.boolean  "summary",                          precision: 1,  scale: 0, default: true
  end

  add_index "operational_plan_photos", ["operational_plan_id"], name: "oper_plan_photo_opplanid_idx"

  create_table "operational_plans", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "end_at_plus_1_w"
    t.string   "title_int",             limit: 256
    t.string   "subtitle_int",          limit: 256
    t.string   "intro_int",             limit: 4000
    t.string   "title_ext",             limit: 256
    t.string   "subtitle_ext",          limit: 256
    t.string   "intro_ext",             limit: 4000
    t.boolean  "allow_include_changes",              precision: 1,  scale: 0, default: true
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.integer  "creator_id",                         precision: 38, scale: 0
    t.integer  "updater_id",                         precision: 38, scale: 0
    t.string   "weeks_array",           limit: 4000
    t.string   "no_so_msg_int",         limit: 256
    t.string   "no_so_msg_ext",         limit: 256
    t.integer  "flag_selector_int",                  precision: 38, scale: 0, default: 1
    t.integer  "flag_selector_ext",                  precision: 38, scale: 0, default: 2
    t.string   "no_oo_msg_int",         limit: 256
    t.string   "no_oo_msg_ext",         limit: 256
    t.string   "title_3",               limit: 256
    t.string   "subtitle_3",            limit: 256
    t.string   "intro_3",               limit: 4000
    t.integer  "flag_selector_3",                    precision: 38, scale: 0, default: 2
    t.string   "no_so_msg_3",           limit: 256
    t.string   "no_oo_msg_3",           limit: 256
    t.boolean  "show",                               precision: 1,  scale: 0, default: true
  end

  add_index "operational_plans", ["end_at_plus_1_w"], name: "strat_pln_end_date_idx"
  add_index "operational_plans", ["start_at"], name: "i_operational_plans_start_at"

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "office"
    t.string   "extn"
    t.string   "start_date"
    t.string   "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_attributes", force: true do |t|
    t.string   "column"
    t.boolean  "active",     precision: 1, scale: 0, default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postpone_reasons", force: true do |t|
    t.string   "name"
    t.boolean  "obsolete",             precision: 1,  scale: 0, default: false
    t.string   "scope",      limit: 2,                          default: "so"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "creator_id",           precision: 38, scale: 0
    t.integer  "updater_id",           precision: 38, scale: 0
    t.integer  "position",             precision: 38, scale: 0, default: 1000
  end

  add_index "postpone_reasons", ["obsolete", "name"], name: "postpone_idx"

