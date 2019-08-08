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

ActiveRecord::Schema.define(version: 2019_07_20_192337) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ip_address", null: false
    t.integer "father_age_id", null: false
    t.integer "father_residency_id", null: false
    t.integer "father_grade_id", null: false
    t.integer "mother_age_id", null: false
    t.integer "mother_residency_id", null: false
    t.integer "mother_grade_id", null: false
    t.integer "age_id", null: false
    t.integer "residency_id", null: false
    t.integer "grade_id", null: false
    t.integer "sex", null: false
    t.integer "do_you_go_to_school", null: false
    t.integer "actualmente_trabajas"
    t.integer "padre_trabajaba"
    t.integer "cuenta_con_servicios_medicos"
    t.integer "cuenta_con_servicios_medicos_padre"
    t.integer "tipo_de_trabajo"
    t.integer "tipo_de_trabajo_padre"
    t.integer "tiene_empleados"
    t.integer "tiene_empleados_padre"
    t.integer "cuantos_empleados"
    t.integer "cuantos_empleados_padre"
    t.integer "tiempo_trabajo"
    t.integer "tiempo_trabajo_padre"
    t.integer "sector_empleo"
    t.integer "sector_empleo_padre"
    t.integer "en_hogar_habia_celular"
    t.integer "en_hogar_habia_telefono_fijo"
    t.integer "en_hogar_habia_internet"
    t.integer "en_hogar_habia_estufa"
    t.integer "en_hogar_habia_refri"
    t.integer "en_hogar_habia_calentador"
    t.integer "en_hogar_habia_tostador"
    t.integer "en_hogar_habia_agua"
    t.integer "en_hogar_habia_bano"
    t.integer "en_hogar_habia_electricidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
