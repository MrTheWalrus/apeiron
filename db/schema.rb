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

ActiveRecord::Schema.define(version: 20161208064715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_stat_statements"

  create_table "academic_years", force: true do |t|
    t.integer  "district_id"
    t.date     "starts_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "ends_on"
    t.boolean  "caseload_wizard_enabled", default: false, null: false
    t.boolean  "staffing_enabled"
    t.boolean  "scheduling_enabled"
    t.boolean  "week_submission_enabled"
    t.integer  "auto_submit_day"
    t.boolean  "schedule_export_enabled", default: false
  end

  add_index "academic_years", ["district_id"], name: "index_academic_years_on_district_id", using: :btree

  create_table "assigned_students", force: true do |t|
    t.integer  "student_id"
    t.integer  "user_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_students", ["student_id"], name: "index_assigned_students_on_student_id", using: :btree
  add_index "assigned_students", ["user_profile_id"], name: "index_assigned_students_on_user_profile_id", using: :btree

  create_table "classrooms", force: true do |t|
    t.string   "name",             limit: 40
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subgrade_id"
    t.integer  "academic_year_id"
  end

  add_index "classrooms", ["name", "school_id"], name: "index_classrooms_on_name_and_school_id", unique: true, using: :btree
  add_index "classrooms", ["school_id"], name: "index_classrooms_on_school_id", using: :btree
  add_index "classrooms", ["subgrade_id"], name: "index_classrooms_on_subgrade_id", using: :btree

  create_table "configurations", force: true do |t|
    t.integer  "target_dst"
    t.integer  "maximum_caseload"
    t.time     "lunch_start"
    t.integer  "lunch_duration"
    t.integer  "maximum_travel_time"
    t.boolean  "spread_appointments"
    t.boolean  "allow_mixed_durations"
    t.string   "configurable_type",                   limit: 20
    t.integer  "configurable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "assistant"
    t.integer  "asst_target_dst"
    t.integer  "asst_maximum_caseload"
    t.boolean  "asst_spread_appointments"
    t.boolean  "asst_allow_mixed_durations"
    t.string   "fullness_rank_name1"
    t.string   "fullness_rank_name2"
    t.string   "fullness_rank_name3"
    t.string   "fullness_rank_name4"
    t.integer  "fullness_rank_limit1"
    t.integer  "fullness_rank_limit2"
    t.integer  "fullness_rank_limit3"
    t.integer  "fullness_rank_limit4"
    t.boolean  "use_actual_travel_time"
    t.integer  "normal_work_day"
    t.string   "fte_round"
    t.boolean  "asst_subject_to_schoolwide_blackout"
    t.integer  "fit_target_percent_dst"
    t.integer  "fit_near_minimum_fte"
    t.boolean  "one_appointment_per_day"
    t.boolean  "two_school_pass1"
    t.boolean  "two_school_pass2"
    t.boolean  "two_school_pass5"
    t.boolean  "do_top_off_phase",                               default: false
    t.boolean  "do_pre_assign_only",                             default: false
    t.integer  "academic_year_id"
    t.integer  "preparation_time",                               default: 0
  end

  add_index "configurations", ["configurable_type", "configurable_id"], name: "index_configurations_on_configurable_type_and_configurable_id", using: :btree

  create_table "district_grades", force: true do |t|
    t.string   "name"
    t.integer  "level",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "district_id"
    t.integer  "canonical_grade_id"
    t.integer  "academic_year_id"
  end

  add_index "district_grades", ["district_id"], name: "index_district_grades_on_district_id", using: :btree

  create_table "district_period_allocations", force: true do |t|
    t.integer  "district_period_definition_id"
    t.integer  "district_grade_id"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  add_index "district_period_allocations", ["district_period_definition_id"], name: "index_district_period_allocations_on_definition_id", using: :btree

  create_table "district_period_definitions", force: true do |t|
    t.integer  "district_schedule_context_id"
    t.integer  "period_type_id"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.integer  "pull_out_permission",          default: 0, null: false
    t.integer  "push_in_permission",           default: 0, null: false
    t.integer  "academic_year_id"
  end

  add_index "district_period_definitions", ["district_schedule_context_id"], name: "index_district_period_definitions_on_context_id", using: :btree

  create_table "district_schedule_contexts", force: true do |t|
    t.integer  "academic_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lunch_duration"
    t.integer  "planning_duration"
  end

  add_index "district_schedule_contexts", ["academic_year_id"], name: "index_district_schedule_contexts_on_academic_year_id", using: :btree

  create_table "district_specials", force: true do |t|
    t.integer  "district_schedule_context_id"
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  add_index "district_specials", ["district_schedule_context_id"], name: "index_district_specials_on_district_schedule_context_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone",  default: "Etc/UTC"
    t.boolean  "active",     default: true,      null: false
  end

  add_index "districts", ["name"], name: "district_name_unique", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",                 limit: 20
    t.integer  "day"
    t.integer  "school_id"
    t.boolean  "moved",                           default: false, null: false
    t.integer  "indirect_activity_id"
    t.integer  "academic_year_id"
    t.integer  "event_series_id"
  end

  add_index "events", ["event_series_id"], name: "index_events_on_event_series_id", using: :btree
  add_index "events", ["moved"], name: "index_events_on_moved", using: :btree
  add_index "events", ["schedule_id"], name: "index_events_on_schedule_id", using: :btree
  add_index "events", ["school_id"], name: "index_events_on_school_id", using: :btree

  create_table "failures", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "iep_service_name"
    t.string   "student_name"
    t.integer  "service_schedule_set_id"
  end

  add_index "failures", ["service_schedule_set_id"], name: "index_failures_on_service_schedule_set_id", using: :btree

  create_table "goals", force: true do |t|
    t.decimal  "value"
    t.string   "school_level",     limit: 15
    t.integer  "district_id"
    t.integer  "academic_year_id"
    t.integer  "metric_id"
    t.integer  "service_id"
    t.integer  "need_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["academic_year_id"], name: "index_goals_on_academic_year_id", using: :btree
  add_index "goals", ["district_id"], name: "index_goals_on_district_id", using: :btree
  add_index "goals", ["metric_id"], name: "index_goals_on_metric_id", using: :btree
  add_index "goals", ["need_id"], name: "index_goals_on_need_id", using: :btree
  add_index "goals", ["service_id"], name: "index_goals_on_service_id", using: :btree

  create_table "grade_span_limits", force: true do |t|
    t.integer  "from_grade",       null: false
    t.integer  "to_grade",         null: false
    t.integer  "limit",            null: false
    t.integer  "configuration_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  create_table "group_size_limits", force: true do |t|
    t.integer  "from_grade",       null: false
    t.integer  "to_grade",         null: false
    t.string   "location",         null: false
    t.integer  "configuration_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "need_id"
    t.boolean  "any_need",         null: false
    t.integer  "limit",            null: false
    t.integer  "academic_year_id"
  end

  create_table "iep_service_needs", force: true do |t|
    t.integer  "iep_service_id", null: false
    t.integer  "need_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "iep_service_needs", ["iep_service_id", "need_id"], name: "index_iep_service_needs_on_iep_service_id_and_need_id", unique: true, using: :btree
  add_index "iep_service_needs", ["need_id"], name: "index_iep_service_needs_on_need_id", using: :btree

  create_table "iep_services", force: true do |t|
    t.integer  "duration"
    t.integer  "frequency"
    t.string   "period",                    limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "student_id"
    t.integer  "service_id"
    t.uuid     "uuid"
    t.string   "pre_assigned_practitioner"
    t.integer  "grouping",                             default: 0, null: false
    t.integer  "setting",                              default: 0, null: false
    t.integer  "academic_year_id"
  end

  add_index "iep_services", ["service_id"], name: "index_iep_services_on_service_id", using: :btree
  add_index "iep_services", ["student_id"], name: "index_iep_services_on_student_id", using: :btree
  add_index "iep_services", ["uuid"], name: "index_iep_services_on_uuid", unique: true, using: :btree

  create_table "import_log_notices", force: true do |t|
    t.integer  "import_log_id"
    t.string   "notice_type"
    t.text     "message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  create_table "import_logs", force: true do |t|
    t.integer  "district_id"
    t.string   "kind"
    t.integer  "successful_rows"
    t.integer  "total_error_rows"
    t.integer  "user_profile_id"
    t.string   "csv"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  create_table "import_traces", force: true do |t|
    t.integer  "import_id"
    t.integer  "line_number"
    t.string   "kind"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  create_table "imports", force: true do |t|
    t.string   "kind"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  create_table "indirect_activities", force: true do |t|
    t.string   "name"
    t.integer  "academic_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_schedule_sets", force: true do |t|
    t.string   "name",             null: false
    t.integer  "district_id",      null: false
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  add_index "master_schedule_sets", ["district_id"], name: "index_master_schedule_sets_on_district_id", using: :btree

  create_table "need_period_types", force: true do |t|
    t.integer  "need_id"
    t.integer  "period_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "need_period_types", ["need_id"], name: "index_need_period_types_on_need_id", using: :btree
  add_index "need_period_types", ["period_type_id"], name: "index_need_period_types_on_period_type_id", using: :btree

  create_table "needs", force: true do |t|
    t.integer  "service_id",       null: false
    t.text     "name",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  create_table "partial_days", force: true do |t|
    t.string   "academic_session_name"
    t.integer  "school_id"
    t.time     "start_time",            null: false
    t.time     "end_time",              null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "academic_year_id"
  end

  add_index "partial_days", ["school_id"], name: "index_partial_days_on_school_id", using: :btree

  create_table "periods", force: true do |t|
    t.integer  "schedule_period_allocation_id"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.integer  "academic_year_id"
  end

  add_index "periods", ["schedule_period_allocation_id"], name: "index_periods_on_schedule_period_allocation_id", using: :btree

  create_table "projects", force: true do |t|
    t.text     "name"
    t.text     "proposer"
    t.text     "description"
    t.text     "resources"
    t.datetime "approved_at"
    t.string   "status"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.text     "name"
    t.decimal  "quantity"
    t.text     "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restrictions", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "days_mask",               limit: 15
    t.boolean  "applies_to_whole_school"
    t.integer  "school_id"
    t.integer  "classroom_id"
    t.integer  "subgrade_id"
    t.integer  "period_type_id"
    t.integer  "push_in_permission",                 default: 0,  null: false
    t.integer  "pull_out_permission",                default: 0,  null: false
    t.integer  "academic_year_id"
    t.string   "label",                              default: "", null: false
    t.string   "short_name",              limit: 10, default: "", null: false
  end

  add_index "restrictions", ["classroom_id"], name: "index_restrictions_on_classroom_id", using: :btree
  add_index "restrictions", ["period_type_id"], name: "index_restrictions_on_period_type_id", using: :btree
  add_index "restrictions", ["school_id"], name: "index_restrictions_on_school_id", using: :btree
  add_index "restrictions", ["subgrade_id"], name: "index_restrictions_on_subgrade_id", using: :btree

  create_table "schedule_collaborations", force: true do |t|
    t.integer  "user_profile_id"
    t.integer  "schedule_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  create_table "schedule_period_allocations", force: true do |t|
    t.integer  "schedule_period_definition_id"
    t.integer  "subgrade_id"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
    t.boolean  "removed",                       default: false
  end

  add_index "schedule_period_allocations", ["schedule_period_definition_id"], name: "index_schedule_period_allocations_on_definition_id", using: :btree

  create_table "schedule_period_definitions", force: true do |t|
    t.integer  "school_schedule_context_id"
    t.integer  "period_type_id"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.integer  "pull_out_permission",        default: 0, null: false
    t.integer  "push_in_permission",         default: 0, null: false
    t.integer  "academic_year_id"
  end

  add_index "schedule_period_definitions", ["school_schedule_context_id"], name: "index_schedule_period_definitions_on_context_id", using: :btree

  create_table "schedule_warnings", force: true do |t|
    t.text     "message"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",        default: "user", null: false
  end

  create_table "scheduled_services", force: true do |t|
    t.integer  "student_id"
    t.integer  "iep_service_id"
    t.integer  "schedulable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "schedulable_type", default: "Event"
    t.integer  "academic_year_id"
  end

  add_index "scheduled_services", ["iep_service_id"], name: "index_scheduled_services_on_iep_service_id", using: :btree
  add_index "scheduled_services", ["schedulable_id"], name: "index_scheduled_services_on_event_id", using: :btree
  add_index "scheduled_services", ["student_id"], name: "index_scheduled_services_on_student_id", using: :btree

  create_table "schedules", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_free_days"
    t.text     "name"
    t.integer  "duration_per_period"
    t.integer  "percent_direct_service_time"
    t.integer  "district_schedule_index"
    t.boolean  "itinerant"
    t.integer  "service_schedule_set_id"
    t.string   "practitioner"
    t.float    "target_fte"
    t.float    "target_maximum_fte"
    t.boolean  "remnant"
    t.boolean  "dirty",                       default: false
    t.hstore   "calculated_data"
    t.integer  "academic_year_id"
    t.boolean  "support_requested",           default: false, null: false
  end

  add_index "schedules", ["service_schedule_set_id", "district_schedule_index"], name: "schedules_dss_and_dsi_index", using: :btree
  add_index "schedules", ["service_schedule_set_id"], name: "index_schedules_on_service_schedule_set_id", using: :btree

  create_table "scheduling_schools", force: true do |t|
    t.integer  "school_id"
    t.time     "student_day_start"
    t.time     "student_day_end"
    t.time     "lunch_window_start"
    t.time     "lunch_window_end"
    t.integer  "cafeteria_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scheduling_schools", ["school_id"], name: "index_scheduling_schools_on_school_id", using: :btree

  create_table "school_grades", force: true do |t|
    t.integer  "district_grade_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  add_index "school_grades", ["district_grade_id"], name: "index_school_grades_on_district_grade_id", using: :btree
  add_index "school_grades", ["school_id"], name: "index_school_grades_on_school_id", using: :btree

  create_table "school_schedule_contexts", force: true do |t|
    t.integer  "school_schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ie_schedule_strategy"
    t.text     "notes"
    t.time     "student_day_start"
    t.time     "student_day_end"
    t.time     "lunch_window_start"
    t.time     "lunch_window_end"
    t.integer  "cafeteria_capacity"
    t.integer  "lunch_duration"
    t.integer  "planning_duration"
    t.integer  "academic_year_id"
    t.boolean  "special_rotation_by_subgrade", default: false, null: false
  end

  add_index "school_schedule_contexts", ["school_schedule_id"], name: "index_school_schedule_contexts_on_school_schedule_id", using: :btree

  create_table "school_schedule_special_rotations", force: true do |t|
    t.integer  "school_schedule_context_id"
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
    t.integer  "school_special_id"
    t.integer  "subgrade_id"
  end

  add_index "school_schedule_special_rotations", ["school_schedule_context_id"], name: "index_school_schedule_special_rotations_on_school_schedule_cont", using: :btree
  add_index "school_schedule_special_rotations", ["school_special_id"], name: "index_school_schedule_special_rotations_on_school_special_id", using: :btree
  add_index "school_schedule_special_rotations", ["subgrade_id"], name: "index_school_schedule_special_rotations_on_subgrade_id", using: :btree

  create_table "school_schedules", force: true do |t|
    t.integer  "academic_year_id"
    t.integer  "school_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",              limit: 40, null: false
    t.integer  "regular_schedule_id"
  end

  add_index "school_schedules", ["academic_year_id"], name: "index_school_schedules_on_academic_year_id", using: :btree
  add_index "school_schedules", ["regular_schedule_id"], name: "index_school_schedules_on_regular_schedule_id", using: :btree
  add_index "school_schedules", ["school_id"], name: "index_school_schedules_on_school_id", using: :btree

  create_table "school_specials", force: true do |t|
    t.integer  "academic_year_id"
    t.integer  "school_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_specials", ["academic_year_id"], name: "index_school_specials_on_academic_year_id", using: :btree
  add_index "school_specials", ["school_id"], name: "index_school_specials_on_school_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_students",              default: 0
    t.string   "level",            limit: 15
    t.time     "full_start"
    t.time     "full_end"
    t.uuid     "uuid"
    t.integer  "academic_year_id"
  end

  add_index "schools", ["district_id", "academic_year_id"], name: "index_schools_on_district_id_and_academic_year_id", using: :btree
  add_index "schools", ["district_id"], name: "index_schools_on_district_id", using: :btree
  add_index "schools", ["name", "academic_year_id"], name: "index_schools_on_name_and_academic_year_id", unique: true, using: :btree
  add_index "schools", ["uuid"], name: "index_schools_on_uuid", unique: true, using: :btree

  create_table "section_special_rotation_sequences", force: true do |t|
    t.integer  "academic_year_id"
    t.integer  "section_id"
    t.string   "rotation_sequence", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "period_id"
  end

  add_index "section_special_rotation_sequences", ["academic_year_id"], name: "index_section_special_rotation_sequences_on_academic_year_id", using: :btree
  add_index "section_special_rotation_sequences", ["period_id"], name: "index_section_special_rotation_sequences_on_period_id", using: :btree
  add_index "section_special_rotation_sequences", ["section_id"], name: "index_section_special_rotation_sequences_on_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "school_schedule_id"
    t.integer  "subgrade_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.integer  "academic_year_id"
    t.string   "teacher_name",       limit: 30, default: "", null: false
  end

  add_index "sections", ["school_schedule_id"], name: "index_sections_on_school_schedule_id", using: :btree

  create_table "service_schedule_set_warnings", force: true do |t|
    t.text     "message"
    t.integer  "service_schedule_set_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "academic_year_id"
  end

  create_table "service_schedule_sets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.integer  "master_schedule_set_id"
    t.hstore   "stats"
    t.string   "status"
    t.integer  "academic_year_id"
  end

  add_index "service_schedule_sets", ["master_schedule_set_id"], name: "index_service_schedule_sets_on_master_schedule_set_id", using: :btree
  add_index "service_schedule_sets", ["service_id"], name: "index_service_schedule_sets_on_service_id", using: :btree
  add_index "service_schedule_sets", ["stats"], name: "service_schedule_sets_stats", using: :gin

  create_table "services", force: true do |t|
    t.string   "name",                                       null: false
    t.integer  "district_id",                                null: false
    t.integer  "service_type_id",                            null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "academic_year_id"
    t.boolean  "scheduling_support_enabled", default: false, null: false
  end

  add_index "services", ["district_id"], name: "index_services_on_district_id", using: :btree
  add_index "services", ["name"], name: "index_services_on_name", using: :btree
  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "staffing_schools", force: true do |t|
    t.time     "staff_day_start"
    t.time     "staff_day_end"
    t.time     "staff_lunch_start"
    t.integer  "staff_lunch_duration"
    t.integer  "school_id"
    t.boolean  "use_school_lunch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staffing_schools", ["school_id"], name: "index_staffing_schools_on_school_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "first_name",                       limit: 30
    t.string   "last_name",                        limit: 30
    t.string   "middle_name",                      limit: 30
    t.integer  "school_id"
    t.integer  "classroom_id"
    t.string   "race",                             limit: 50
    t.string   "state_id_number",                  limit: 20
    t.string   "student_id_number",                limit: 20
    t.string   "status",                           limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sped",                                        default: true
    t.string   "case_manager"
    t.string   "disability_category"
    t.string   "program_type_code"
    t.date     "services_begin"
    t.date     "services_end"
    t.string   "special_education_classification"
    t.string   "academic_session_name"
    t.uuid     "uuid"
    t.integer  "subgrade_id"
    t.integer  "academic_year_id"
  end

  add_index "students", ["classroom_id"], name: "index_students_on_classroom_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree
  add_index "students", ["state_id_number"], name: "index_students_on_state_id_number", using: :btree
  add_index "students", ["student_id_number"], name: "index_students_on_student_id_number", using: :btree
  add_index "students", ["subgrade_id"], name: "index_students_on_subgrade_id", using: :btree
  add_index "students", ["uuid"], name: "index_students_on_uuid", unique: true, using: :btree

  create_table "subgrades", force: true do |t|
    t.integer  "school_grade_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_estimate"
    t.integer  "academic_year_id"
  end

  add_index "subgrades", ["school_grade_id"], name: "index_subgrades_on_school_grade_id", using: :btree

  create_table "submitted_weeks", force: true do |t|
    t.boolean  "auto_submitted"
    t.integer  "schedule_id"
    t.integer  "week"
    t.text     "changes_this_week"
    t.text     "how_can_district_help"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  create_table "target_preferences", force: true do |t|
    t.integer  "target_id"
    t.integer  "position"
    t.integer  "school_id"
    t.float    "maximum_fte"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "targets", force: true do |t|
    t.string   "name"
    t.float    "maximum_fte"
    t.integer  "maximum_days"
    t.string   "practitioner"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "configuration_id"
    t.uuid     "uuid"
    t.string   "district_id_number"
  end

  add_index "targets", ["district_id_number"], name: "index_targets_on_district_id_number", using: :btree
  add_index "targets", ["uuid"], name: "index_targets_on_uuid", unique: true, using: :btree

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
  end

  create_table "travel_times", force: true do |t|
    t.integer  "source_school_id"
    t.integer  "destination_school_id"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_year_id"
  end

  add_index "travel_times", ["source_school_id"], name: "index_travel_times_on_source_school_id", using: :btree

  create_table "user_profiles", force: true do |t|
    t.integer  "academic_year_id"
    t.integer  "assigned_schedule_id"
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "school_id"
    t.integer  "caseload_wizard_status", default: 0, null: false
    t.string   "exported_calendar_id"
  end

  add_index "user_profiles", ["assigned_schedule_id"], name: "index_user_profiles_on_assigned_schedule_id", using: :btree
  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                   default: "",   null: false
    t.string   "encrypted_password",      default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "district_id",                            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "has_temp_password",       default: true
    t.string   "app_module_id"
    t.integer  "active_academic_year_id"
    t.datetime "invited_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
