class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ip_address, null: false
      t.integer :edad, null: false
      t.string :estado_residencia, null: false
      t.string :ultimo_grado_cursado, null: false
      t.integer :sexo, null: false
      t.boolean :asistes_escuela, null: false

      t.timestamps
    end
  end
end
