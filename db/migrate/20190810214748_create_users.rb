class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ip_address, null: false
      t.integer :father_age, null: false
      t.references :father_residency, null: false, foreign_key: { to_table: :states }
      t.references :father_education_grade, null: false, foreign_key: { to_table: :education_grades }
      t.integer :mother_age, null: false
      t.references :mother_residency, null: false, foreign_key: { to_table: :states }
      t.references :mother_education_grade, null: false, foreign_key: { to_table: :education_grades }
      t.integer :age, null: false
      t.references :age_group, null: false, foreign_key: true
      t.references :residency, null: false, foreign_key: { to_table: :states }
      t.references :sex, null: false
      t.references :education_grade, null: false
      t.boolean :is_student, null: false
      t.integer :father_is_employed
      t.integer :father_has_healthcare
      t.references :father_job_type, foreign_key: { to_table: :job_types }
      t.references :father_job_employees_group, foreign_key: { to_table: :job_employees_groups }
      t.integer :mother_is_employed
      t.integer :mother_has_healthcare
      t.references :mother_job_type, foreign_key: { to_table: :job_types }
      t.references :mother_job_employees_group, foreign_key: { to_table: :job_employees_groups }
      t.boolean :is_employed
      t.boolean :is_first_job
      t.boolean :has_healthcare
      t.references :job_type
      t.boolean :has_employees
      t.references :job_employees_group
      t.references :job_schedule
      t.references :job_sector
      t.integer :home_had_mobile_phone
      t.integer :home_had_fixed_phone
      t.integer :home_had_internet
      t.integer :home_had_stove
      t.integer :home_had_fridge
      t.integer :home_had_heater
      t.integer :home_had_toaster
      t.integer :home_had_water
      t.integer :home_had_bathroom
      t.integer :home_had_electricity

      t.timestamps
    end
  end
end
