class CreateKpisLifeExpectanciesCountry < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_life_expectancies_country, id: false do |t|
      t.integer :age, null: false
      t.references :sex, null: false, foreign_key: true
      t.float :expected_age, null: false
    end

    add_index :kpis_life_expectancies_country,
              [:age, :sex_id],
              unique: true,
              name: "kpis_life_expectancies_country_key"
  end

end
