class CreateEducationGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :education_grades do |t|
      t.string :description, null: false
      t.integer :school_year, null: false
      t.references :education_level, null: false, foreign_key: true
    end
  end
end
