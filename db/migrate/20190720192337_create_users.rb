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
      t.boolean :cuenta_con_servicios_medicos
      t.integer :tipo_de_trabajo
      t.integer :tienes_empleados
      t.integer :cuantos_empleados
      t.integer :tiempo_trabajo_padre
      t.integer :cuantos_empleados_padre
      t.integer :sector_empleo_padre

      t.timestamps
    end
  end
end
