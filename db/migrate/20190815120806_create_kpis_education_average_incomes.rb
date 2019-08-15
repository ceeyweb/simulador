class CreateKpisEducationAverageIncomes < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_education_average_incomes, id: false do |t|
      t.references :sex, null: false, foreign_key: true
      t.references :education_level, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.integer :average_income, null: false
    end

    add_index :kpis_education_average_incomes,
              [:sex_id, :education_level_id, :region_id],
              unique: true,
              name: "kpis_education_average_incomes_key"
  end

end
