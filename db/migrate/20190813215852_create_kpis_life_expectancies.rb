class CreateKpisLifeExpectancies < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_life_expectancies, id: false do |t|
      t.integer :age, null: false
      t.references :sex, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.float :expected_age, null: false
      t.float :state_school_year, null: false
    end

    add_index :kpis_life_expectancies,
              [:age, :sex_id, :state_id],
              unique: true,
              name: "kpis_life_expectancies_key"
  end

end
