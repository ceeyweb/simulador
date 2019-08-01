class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ip_address, null: false
      t.integer :edad, null: false
      t.string :estado_residencia, null: false
      t.string :ultimo_grado_cursado, null: false
      t.integer :sexo, null: false
      t.boolean :asistes_escuela, null: false
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
      t.integer :edad_padre
      t.string :estado_residencia_padre
      t.string :ultimo_grado_cursado_padre
      t.integer :edad_madre
      t.string :estado_residencia_madre
      t.string :ultimo_grado_cursado_madre

      t.timestamps
    end
  end
end
