class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ip_address, null: false
      t.integer :father_age_id, null: false
      t.integer :father_residency_id, null: false
      t.integer :father_grade_id, null: false
      t.integer :mother_age_id, null: false
      t.integer :mother_residency_id, null: false
      t.integer :mother_grade_id, null: false
      t.integer :age_id, null: false
      t.integer :residency_id, null: false
      t.integer :grade_id, null: false
      t.integer :sex, null: false
      t.integer :do_you_go_to_school, null: false
      t.integer :father_is_employed
      t.integer :father_has_healthcare
      t.integer :father_job_type
      t.integer :father_has_employees
      t.integer :mother_is_employed
      t.integer :mother_has_healthcare
      t.integer :mother_job_type
      t.integer :mother_has_employees
      t.integer :is_employed
      t.integer :is_first_job
      t.integer :has_healthcare
      t.integer :job_type_id
      t.integer :has_employees
      t.integer :job_time_id
      t.integer :job_sector_id
      t.integer :how_many_employees_id
      t.integer :en_hogar_habia_celular
      t.integer :en_hogar_habia_telefono_fijo
      t.integer :en_hogar_habia_internet
      t.integer :en_hogar_habia_estufa
      t.integer :en_hogar_habia_refri
      t.integer :en_hogar_habia_calentador
      t.integer :en_hogar_habia_tostador
      t.integer :en_hogar_habia_agua
      t.integer :en_hogar_habia_bano
      t.integer :en_hogar_habia_electricidad

      t.timestamps
    end
  end
end
