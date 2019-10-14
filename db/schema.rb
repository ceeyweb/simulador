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

ActiveRecord::Schema.define(version: 2019_10_13_140101) do

  create_table "age_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
    t.integer "lower_limit", null: false
    t.integer "upper_limit", null: false
  end

  create_table "education_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
    t.integer "school_year", null: false
    t.bigint "education_level_id", null: false
    t.index ["education_level_id"], name: "index_education_grades_on_education_level_id"
  end

  create_table "education_levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "job_employees_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "job_schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "job_sectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "job_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "kpis_education_achievement_age_tertiles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tertile", null: false
    t.bigint "age_group_id", null: false
    t.integer "lower_limit", null: false
    t.integer "upper_limit", null: false
    t.index ["age_group_id"], name: "index_kpis_education_achievement_age_tertiles_on_age_group_id"
  end

  create_table "kpis_education_achievement_region_tertiles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tertile", null: false
    t.bigint "region_id", null: false
    t.integer "lower_limit", null: false
    t.integer "upper_limit", null: false
    t.index ["region_id"], name: "index_kpis_education_achievement_region_tertiles_on_region_id"
  end

  create_table "kpis_education_achievement_sex_tertiles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tertile", null: false
    t.bigint "sex_id", null: false
    t.integer "lower_limit", null: false
    t.integer "upper_limit", null: false
    t.index ["sex_id"], name: "index_kpis_education_achievement_sex_tertiles_on_sex_id"
  end

  create_table "kpis_education_average_incomes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sex_id", null: false
    t.bigint "education_level_id", null: false
    t.bigint "region_id", null: false
    t.float "average_income", null: false
    t.index ["education_level_id"], name: "index_kpis_education_average_incomes_on_education_level_id"
    t.index ["region_id"], name: "index_kpis_education_average_incomes_on_region_id"
    t.index ["sex_id", "education_level_id", "region_id"], name: "kpis_education_average_incomes_key", unique: true
    t.index ["sex_id"], name: "index_kpis_education_average_incomes_on_sex_id"
  end

  create_table "kpis_life_expectancies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.bigint "sex_id", null: false
    t.bigint "state_id", null: false
    t.float "expected_age", null: false
    t.float "state_school_year", null: false
    t.index ["age", "sex_id", "state_id"], name: "kpis_life_expectancies_key", unique: true
    t.index ["sex_id"], name: "index_kpis_life_expectancies_on_sex_id"
    t.index ["state_id"], name: "index_kpis_life_expectancies_on_state_id"
  end

  create_table "kpis_life_expectancies_country", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.bigint "sex_id", null: false
    t.float "expected_age", null: false
    t.index ["age", "sex_id"], name: "kpis_life_expectancies_country_key", unique: true
    t.index ["sex_id"], name: "index_kpis_life_expectancies_country_on_sex_id"
  end

  create_table "kpis_life_expectancies_region", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.bigint "sex_id", null: false
    t.bigint "region_id", null: false
    t.float "expected_age", null: false
    t.index ["age", "sex_id", "region_id"], name: "kpis_life_expectancies_region_key", unique: true
    t.index ["region_id"], name: "index_kpis_life_expectancies_region_on_region_id"
    t.index ["sex_id"], name: "index_kpis_life_expectancies_region_on_sex_id"
  end

  create_table "kpis_life_expectancies_world", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.bigint "sex_id", null: false
    t.float "expected_age", null: false
    t.index ["age", "sex_id"], name: "kpis_life_expectancies_world_key", unique: true
    t.index ["sex_id"], name: "index_kpis_life_expectancies_world_on_sex_id"
  end

  create_table "kpis_work_participation_rates", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sex_id", null: false
    t.bigint "region_id", null: false
    t.integer "age_lower_limit", null: false
    t.integer "age_upper_limit", null: false
    t.float "participation_rate", null: false
    t.float "formal_participation_rate", null: false
    t.index ["region_id"], name: "index_kpis_work_participation_rates_on_region_id"
    t.index ["sex_id", "region_id", "age_lower_limit", "age_upper_limit"], name: "kpis_work_participation_rate_key", unique: true
    t.index ["sex_id"], name: "index_kpis_work_participation_rates_on_sex_id"
  end

  create_table "kpis_work_transition_probabilities", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.float "keep_formal_work_probability", null: false
    t.float "lose_formal_work_probability", null: false
    t.float "lose_informal_work_probability", null: false
    t.float "keep_informal_work_probability", null: false
    t.index ["state_id"], name: "index_kpis_work_transition_probabilities_on_state_id"
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "sexes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", null: false
    t.bigint "region_id", null: false
    t.index ["region_id"], name: "index_states_on_region_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ip_address", null: false
    t.integer "father_age", null: false
    t.bigint "father_residency_id", null: false
    t.bigint "father_education_grade_id", null: false
    t.integer "mother_age", null: false
    t.bigint "mother_residency_id", null: false
    t.bigint "mother_education_grade_id", null: false
    t.integer "age", null: false
    t.bigint "age_group_id", null: false
    t.bigint "residency_id", null: false
    t.bigint "sex_id", null: false
    t.bigint "education_grade_id", null: false
    t.boolean "is_student", null: false
    t.integer "father_is_employed"
    t.integer "father_has_healthcare"
    t.bigint "father_job_type_id"
    t.bigint "father_job_employees_group_id"
    t.integer "mother_is_employed"
    t.integer "mother_has_healthcare"
    t.bigint "mother_job_type_id"
    t.bigint "mother_job_employees_group_id"
    t.boolean "is_employed"
    t.boolean "is_first_job"
    t.boolean "has_healthcare"
    t.bigint "job_type_id"
    t.boolean "has_employees"
    t.bigint "job_employees_group_id"
    t.bigint "job_schedule_id"
    t.bigint "job_sector_id"
    t.integer "home_had_mobile_phone"
    t.integer "home_had_fixed_phone"
    t.integer "home_had_internet"
    t.integer "home_had_stove"
    t.integer "home_had_fridge"
    t.integer "home_had_heater"
    t.integer "home_had_toaster"
    t.integer "home_had_water"
    t.integer "home_had_bathroom"
    t.integer "home_had_electricity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "home_had_washer"
    t.index ["age_group_id"], name: "index_users_on_age_group_id"
    t.index ["education_grade_id"], name: "index_users_on_education_grade_id"
    t.index ["father_education_grade_id"], name: "index_users_on_father_education_grade_id"
    t.index ["father_job_employees_group_id"], name: "index_users_on_father_job_employees_group_id"
    t.index ["father_job_type_id"], name: "index_users_on_father_job_type_id"
    t.index ["father_residency_id"], name: "index_users_on_father_residency_id"
    t.index ["job_employees_group_id"], name: "index_users_on_job_employees_group_id"
    t.index ["job_schedule_id"], name: "index_users_on_job_schedule_id"
    t.index ["job_sector_id"], name: "index_users_on_job_sector_id"
    t.index ["job_type_id"], name: "index_users_on_job_type_id"
    t.index ["mother_education_grade_id"], name: "index_users_on_mother_education_grade_id"
    t.index ["mother_job_employees_group_id"], name: "index_users_on_mother_job_employees_group_id"
    t.index ["mother_job_type_id"], name: "index_users_on_mother_job_type_id"
    t.index ["mother_residency_id"], name: "index_users_on_mother_residency_id"
    t.index ["residency_id"], name: "index_users_on_residency_id"
    t.index ["sex_id"], name: "index_users_on_sex_id"
  end

  add_foreign_key "education_grades", "education_levels"
  add_foreign_key "kpis_education_achievement_age_tertiles", "age_groups"
  add_foreign_key "kpis_education_achievement_region_tertiles", "regions"
  add_foreign_key "kpis_education_achievement_sex_tertiles", "sexes"
  add_foreign_key "kpis_education_average_incomes", "education_levels"
  add_foreign_key "kpis_education_average_incomes", "regions"
  add_foreign_key "kpis_education_average_incomes", "sexes"
  add_foreign_key "kpis_life_expectancies", "sexes"
  add_foreign_key "kpis_life_expectancies", "states"
  add_foreign_key "kpis_life_expectancies_country", "sexes"
  add_foreign_key "kpis_life_expectancies_region", "regions"
  add_foreign_key "kpis_life_expectancies_region", "sexes"
  add_foreign_key "kpis_life_expectancies_world", "sexes"
  add_foreign_key "kpis_work_participation_rates", "regions"
  add_foreign_key "kpis_work_participation_rates", "sexes"
  add_foreign_key "kpis_work_transition_probabilities", "states"
  add_foreign_key "states", "regions"
  add_foreign_key "users", "age_groups"
  add_foreign_key "users", "education_grades", column: "father_education_grade_id"
  add_foreign_key "users", "education_grades", column: "mother_education_grade_id"
  add_foreign_key "users", "job_employees_groups", column: "father_job_employees_group_id"
  add_foreign_key "users", "job_employees_groups", column: "mother_job_employees_group_id"
  add_foreign_key "users", "job_types", column: "father_job_type_id"
  add_foreign_key "users", "job_types", column: "mother_job_type_id"
  add_foreign_key "users", "states", column: "father_residency_id"
  add_foreign_key "users", "states", column: "mother_residency_id"
  add_foreign_key "users", "states", column: "residency_id"
end
