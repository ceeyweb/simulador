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
      t.integer :actualmente_trabajas
      t.integer :padre_trabajaba
      t.integer :cuenta_con_servicios_medicos
      t.integer :cuenta_con_servicios_medicos_padre
      t.integer :tipo_de_trabajo
      t.integer :tipo_de_trabajo_padre
      t.integer :tiene_empleados
      t.integer :tiene_empleados_padre
      t.integer :cuantos_empleados
      t.integer :cuantos_empleados_padre
      t.integer :tiempo_trabajo
      t.integer :tiempo_trabajo_padre
      t.integer :sector_empleo
      t.integer :sector_empleo_padre
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
