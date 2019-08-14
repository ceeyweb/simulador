class CreateKpisLifeExpectanciesWorld < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_life_expectancies_world, id: false do |t|
      t.integer :age, null: false
      t.references :sex, null: false, foreign_key: true
      t.float :expected_age, null: false
    end

    add_index :kpis_life_expectancies_world,
              [:age, :sex_id],
              unique: true,
              name: "kpis_life_expectancies_world_key"
  end

end
