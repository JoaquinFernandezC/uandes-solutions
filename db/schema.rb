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

ActiveRecord::Schema.define(version: 2018_09_20_061339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "aliases", force: :cascade do |t|
    t.bigint "person_id"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_aliases_on_person_id"
  end

  create_table "assigned_to_goals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_assigned_to_goals_on_goal_id"
    t.index ["user_id"], name: "index_assigned_to_goals_on_user_id"
  end

  create_table "authors", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "document_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_authors_on_document_id"
    t.index ["person_id"], name: "index_authors_on_person_id"
  end

  create_table "case_assignations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_case_assignations_on_case_id"
    t.index ["user_id"], name: "index_case_assignations_on_user_id"
  end

  create_table "case_coordinations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "state"
    t.datetime "estimated_end_date"
    t.string "log"
    t.integer "privacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_documents", force: :cascade do |t|
    t.bigint "document_id"
    t.bigint "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_case_documents_on_case_id"
    t.index ["document_id"], name: "index_case_documents_on_document_id"
  end

  create_table "case_task_documents", force: :cascade do |t|
    t.bigint "case_task_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_task_id"], name: "index_case_task_documents_on_case_task_id"
    t.index ["document_id"], name: "index_case_task_documents_on_document_id"
  end

  create_table "case_tasks", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_case_tasks_on_case_id"
    t.index ["task_id"], name: "index_case_tasks_on_task_id"
  end

  create_table "cases", force: :cascade do |t|
    t.string "name"
    t.bigint "regional_pros_office_id"
    t.string "description"
    t.integer "privacy"
    t.bigint "ruc_felony_id"
    t.string "state"
    t.bigint "prosecutor_id"
    t.datetime "estimated_end_date"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prosecutor_id"], name: "index_cases_on_prosecutor_id"
    t.index ["regional_pros_office_id"], name: "index_cases_on_regional_pros_office_id"
    t.index ["ruc_felony_id"], name: "index_cases_on_ruc_felony_id"
  end

  create_table "cc_assignations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_assignations_on_case_coordination_id"
    t.index ["user_id"], name: "index_cc_assignations_on_user_id"
  end

  create_table "cc_documents", force: :cascade do |t|
    t.bigint "document_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_documents_on_case_coordination_id"
    t.index ["document_id"], name: "index_cc_documents_on_document_id"
  end

  create_table "cc_inv_leg_people", force: :cascade do |t|
    t.bigint "legal_person_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_inv_leg_people_on_case_coordination_id"
    t.index ["legal_person_id"], name: "index_cc_inv_leg_people_on_legal_person_id"
  end

  create_table "cc_inv_people", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_inv_people_on_case_coordination_id"
    t.index ["person_id"], name: "index_cc_inv_people_on_person_id"
  end

  create_table "cc_prosecutors", force: :cascade do |t|
    t.bigint "case_coordination_id"
    t.bigint "prosecutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_prosecutors_on_case_coordination_id"
    t.index ["prosecutor_id"], name: "index_cc_prosecutors_on_prosecutor_id"
  end

  create_table "cc_regions", force: :cascade do |t|
    t.bigint "regional_pros_office_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_regions_on_case_coordination_id"
    t.index ["regional_pros_office_id"], name: "index_cc_regions_on_regional_pros_office_id"
  end

  create_table "cc_rucs", force: :cascade do |t|
    t.bigint "ruc_id"
    t.bigint "case_coordination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_rucs_on_case_coordination_id"
    t.index ["ruc_id"], name: "index_cc_rucs_on_ruc_id"
  end

  create_table "cc_task_documents", force: :cascade do |t|
    t.bigint "cc_task_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cc_task_id"], name: "index_cc_task_documents_on_cc_task_id"
    t.index ["document_id"], name: "index_cc_task_documents_on_document_id"
  end

  create_table "cc_tasks", force: :cascade do |t|
    t.bigint "case_coordination_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_coordination_id"], name: "index_cc_tasks_on_case_coordination_id"
    t.index ["task_id"], name: "index_cc_tasks_on_task_id"
  end

  create_table "commentaries", force: :cascade do |t|
    t.text "message"
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_commentaries_on_task_id"
    t.index ["user_id"], name: "index_commentaries_on_user_id"
  end

  create_table "derivation_assignations", force: :cascade do |t|
    t.bigint "derivation_id"
    t.bigint "user_id"
    t.date "assignation_date"
    t.date "deassignment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_derivation_assignations_on_derivation_id"
    t.index ["user_id"], name: "index_derivation_assignations_on_user_id"
  end

  create_table "derivation_documents", force: :cascade do |t|
    t.bigint "derivation_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_derivation_documents_on_derivation_id"
    t.index ["document_id"], name: "index_derivation_documents_on_document_id"
  end

  create_table "derivation_reports", force: :cascade do |t|
    t.bigint "derivation_id"
    t.date "report_date"
    t.string "subject"
    t.integer "identifier_number"
    t.string "action_course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_derivation_reports_on_derivation_id"
  end

  create_table "derivation_task_documents", force: :cascade do |t|
    t.bigint "derivation_task_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_task_id"], name: "index_derivation_task_documents_on_derivation_task_id"
    t.index ["document_id"], name: "index_derivation_task_documents_on_document_id"
  end

  create_table "derivation_tasks", force: :cascade do |t|
    t.bigint "derivation_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_derivation_tasks_on_derivation_id"
    t.index ["task_id"], name: "index_derivation_tasks_on_task_id"
  end

  create_table "derivations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "petitioner_id"
    t.string "state"
    t.integer "priority"
    t.date "derivation_date"
    t.datetime "work_start_date"
    t.string "estimated_work_start_date"
    t.date "estimated_end_date"
    t.date "end_date"
    t.string "log"
    t.integer "privacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petitioner_id"], name: "index_derivations_on_petitioner_id"
  end

  create_table "document_iics", force: :cascade do |t|
    t.bigint "iic_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_iics_on_document_id"
    t.index ["iic_id"], name: "index_document_iics_on_iic_id"
  end

  create_table "document_task_iics", force: :cascade do |t|
    t.bigint "task_iic_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_task_iics_on_document_id"
    t.index ["task_iic_id"], name: "index_document_task_iics_on_task_iic_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.integer "version"
    t.string "classification"
    t.string "type"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "institution_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_employees_on_institution_id"
    t.index ["person_id"], name: "index_employees_on_person_id"
  end

  create_table "error_logs", force: :cascade do |t|
    t.string "code"
    t.string "privacy"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "felonies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goal_documents", force: :cascade do |t|
    t.bigint "goal_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_goal_documents_on_document_id"
    t.index ["goal_id"], name: "index_goal_documents_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "year"
    t.integer "goal_number"
    t.string "name"
    t.text "description"
    t.string "state"
    t.date "estimated_end_date"
    t.date "end_date"
    t.integer "privacy"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "state"
    t.datetime "start_date"
    t.datetime "estimated_end_date"
    t.datetime "end_date"
    t.string "log"
    t.integer "privacy"
    t.boolean "multilateral"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internal_authors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_internal_authors_on_document_id"
    t.index ["user_id"], name: "index_internal_authors_on_user_id"
  end

  create_table "internal_member_iics", force: :cascade do |t|
    t.bigint "iic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iic_id"], name: "index_internal_member_iics_on_iic_id"
    t.index ["user_id"], name: "index_internal_member_iics_on_user_id"
  end

  create_table "inv_legal_people", force: :cascade do |t|
    t.bigint "legal_person_id"
    t.bigint "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_inv_legal_people_on_case_id"
    t.index ["legal_person_id"], name: "index_inv_legal_people_on_legal_person_id"
  end

  create_table "investigated_people", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_investigated_people_on_case_id"
    t.index ["person_id"], name: "index_investigated_people_on_person_id"
  end

  create_table "legal_people", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "code"
    t.string "privacy"
    t.string "action"
    t.boolean "commentary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_iics", force: :cascade do |t|
    t.bigint "iic_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iic_id"], name: "index_manager_iics_on_iic_id"
    t.index ["user_id"], name: "index_manager_iics_on_user_id"
  end

  create_table "member_iics", force: :cascade do |t|
    t.bigint "iic_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_member_iics_on_employee_id"
    t.index ["iic_id"], name: "index_member_iics_on_iic_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "passport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "petitioners", force: :cascade do |t|
    t.bigint "person_id"
    t.string "position"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_petitioners_on_person_id"
  end

  create_table "project_documents", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_project_documents_on_document_id"
    t.index ["project_id"], name: "index_project_documents_on_project_id"
  end

  create_table "project_institutions", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_project_institutions_on_institution_id"
    t.index ["project_id"], name: "index_project_institutions_on_project_id"
  end

  create_table "project_responsables", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_project_responsables_on_employee_id"
    t.index ["project_id"], name: "index_project_responsables_on_project_id"
  end

  create_table "project_stage_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_stage_id"], name: "index_project_stage_users_on_project_stage_id"
    t.index ["user_id"], name: "index_project_stage_users_on_user_id"
  end

  create_table "project_stages", force: :cascade do |t|
    t.bigint "project_id"
    t.integer "stage_number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_stages_on_project_id"
  end

  create_table "project_task_documents", force: :cascade do |t|
    t.bigint "document_id"
    t.bigint "project_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_project_task_documents_on_document_id"
    t.index ["project_task_id"], name: "index_project_task_documents_on_project_task_id"
  end

  create_table "project_tasks", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tasks_on_project_id"
    t.index ["task_id"], name: "index_project_tasks_on_task_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "year"
    t.integer "project_number"
    t.string "name"
    t.string "objective"
    t.string "state"
    t.datetime "start_date"
    t.date "estimated_end_date"
    t.date "end_date"
    t.integer "privacy"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prosecutors", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "local_office"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regional_pros_offices", force: :cascade do |t|
    t.string "region"
    t.bigint "prosecutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prosecutor_id"], name: "index_regional_pros_offices_on_prosecutor_id"
  end

  create_table "report_receiver_people", force: :cascade do |t|
    t.bigint "derivation_id"
    t.bigint "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_report_receiver_people_on_derivation_id"
    t.index ["people_id"], name: "index_report_receiver_people_on_people_id"
  end

  create_table "report_receiver_ulddecos", force: :cascade do |t|
    t.bigint "derivation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["derivation_id"], name: "index_report_receiver_ulddecos_on_derivation_id"
    t.index ["user_id"], name: "index_report_receiver_ulddecos_on_user_id"
  end

  create_table "ruc_felonies", force: :cascade do |t|
    t.bigint "felony_id"
    t.bigint "ruc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["felony_id"], name: "index_ruc_felonies_on_felony_id"
    t.index ["ruc_id"], name: "index_ruc_felonies_on_ruc_id"
  end

  create_table "rucs", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_goal_documents", force: :cascade do |t|
    t.bigint "task_goal_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_task_goal_documents_on_document_id"
    t.index ["task_goal_id"], name: "index_task_goal_documents_on_task_goal_id"
  end

  create_table "task_goals", force: :cascade do |t|
    t.bigint "goal_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_task_goals_on_goal_id"
    t.index ["task_id"], name: "index_task_goals_on_task_id"
  end

  create_table "task_iics", force: :cascade do |t|
    t.bigint "iic_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iic_id"], name: "index_task_iics_on_iic_id"
    t.index ["task_id"], name: "index_task_iics_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "start_date"
    t.datetime "estimated_end_date"
    t.datetime "end_date"
    t.integer "privacy"
    t.integer "priority"
    t.string "state"
    t.boolean "needs_checking"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "rut"
    t.string "position"
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aliases", "people"
  add_foreign_key "assigned_to_goals", "goals"
  add_foreign_key "assigned_to_goals", "users"
  add_foreign_key "authors", "documents"
  add_foreign_key "authors", "people"
  add_foreign_key "case_assignations", "cases"
  add_foreign_key "case_assignations", "users"
  add_foreign_key "case_documents", "cases"
  add_foreign_key "case_documents", "documents"
  add_foreign_key "case_task_documents", "case_tasks"
  add_foreign_key "case_task_documents", "documents"
  add_foreign_key "case_tasks", "cases"
  add_foreign_key "case_tasks", "tasks"
  add_foreign_key "cases", "prosecutors"
  add_foreign_key "cases", "regional_pros_offices"
  add_foreign_key "cases", "ruc_felonies"
  add_foreign_key "cc_assignations", "case_coordinations"
  add_foreign_key "cc_assignations", "users"
  add_foreign_key "cc_documents", "case_coordinations"
  add_foreign_key "cc_documents", "documents"
  add_foreign_key "cc_inv_leg_people", "case_coordinations"
  add_foreign_key "cc_inv_leg_people", "legal_people"
  add_foreign_key "cc_inv_people", "case_coordinations"
  add_foreign_key "cc_inv_people", "people"
  add_foreign_key "cc_prosecutors", "case_coordinations"
  add_foreign_key "cc_prosecutors", "prosecutors"
  add_foreign_key "cc_regions", "case_coordinations"
  add_foreign_key "cc_regions", "regional_pros_offices"
  add_foreign_key "cc_rucs", "case_coordinations"
  add_foreign_key "cc_rucs", "rucs"
  add_foreign_key "cc_task_documents", "cc_tasks"
  add_foreign_key "cc_task_documents", "documents"
  add_foreign_key "cc_tasks", "case_coordinations"
  add_foreign_key "cc_tasks", "tasks"
  add_foreign_key "commentaries", "tasks"
  add_foreign_key "commentaries", "users"
  add_foreign_key "derivation_assignations", "derivations"
  add_foreign_key "derivation_assignations", "users"
  add_foreign_key "derivation_documents", "derivations"
  add_foreign_key "derivation_documents", "documents"
  add_foreign_key "derivation_reports", "derivations"
  add_foreign_key "derivation_task_documents", "derivation_tasks"
  add_foreign_key "derivation_task_documents", "documents"
  add_foreign_key "derivation_tasks", "derivations"
  add_foreign_key "derivation_tasks", "tasks"
  add_foreign_key "derivations", "petitioners"
  add_foreign_key "document_iics", "documents"
  add_foreign_key "document_iics", "iics"
  add_foreign_key "document_task_iics", "documents"
  add_foreign_key "document_task_iics", "task_iics"
  add_foreign_key "employees", "institutions"
  add_foreign_key "employees", "people"
  add_foreign_key "goal_documents", "documents"
  add_foreign_key "goal_documents", "goals"
  add_foreign_key "internal_authors", "documents"
  add_foreign_key "internal_authors", "users"
  add_foreign_key "internal_member_iics", "iics"
  add_foreign_key "internal_member_iics", "users"
  add_foreign_key "inv_legal_people", "cases"
  add_foreign_key "inv_legal_people", "legal_people"
  add_foreign_key "investigated_people", "cases"
  add_foreign_key "investigated_people", "people"
  add_foreign_key "manager_iics", "iics"
  add_foreign_key "manager_iics", "users"
  add_foreign_key "member_iics", "employees"
  add_foreign_key "member_iics", "iics"
  add_foreign_key "petitioners", "people"
  add_foreign_key "project_documents", "documents"
  add_foreign_key "project_documents", "projects"
  add_foreign_key "project_institutions", "institutions"
  add_foreign_key "project_institutions", "projects"
  add_foreign_key "project_responsables", "employees"
  add_foreign_key "project_responsables", "projects"
  add_foreign_key "project_stage_users", "project_stages"
  add_foreign_key "project_stage_users", "users"
  add_foreign_key "project_stages", "projects"
  add_foreign_key "project_task_documents", "documents"
  add_foreign_key "project_task_documents", "project_tasks"
  add_foreign_key "project_tasks", "projects"
  add_foreign_key "project_tasks", "tasks"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "regional_pros_offices", "prosecutors"
  add_foreign_key "report_receiver_people", "derivations"
  add_foreign_key "report_receiver_people", "people", column: "people_id"
  add_foreign_key "report_receiver_ulddecos", "derivations"
  add_foreign_key "report_receiver_ulddecos", "users"
  add_foreign_key "ruc_felonies", "felonies"
  add_foreign_key "ruc_felonies", "rucs"
  add_foreign_key "task_goal_documents", "documents"
  add_foreign_key "task_goal_documents", "task_goals"
  add_foreign_key "task_goals", "goals"
  add_foreign_key "task_goals", "tasks"
  add_foreign_key "task_iics", "iics"
  add_foreign_key "task_iics", "tasks"
  add_foreign_key "tasks", "users"
end
