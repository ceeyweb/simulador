class CreateKpisWorkParticipationRates < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_work_participation_rates, id: false do |t|
      t.references :sex, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.integer :age_lower_limit, null: false
      t.integer :age_upper_limit, null: false
      t.float :participation_rate, null: false
      t.float :formal_participation_rate, null: false
    end

    add_index :kpis_work_participation_rates,
              [:sex_id, :region_id, :age_lower_limit, :age_upper_limit],
              unique: true,
              name: "kpis_work_participation_rate_key"
  end

end
