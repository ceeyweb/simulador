class CreateKpisEducationAchievementRegionTertiles < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_education_achievement_region_tertiles, id: false do |t|
      t.integer :tertile, null: false
      t.references :region, null: false, foreign_key: true
      t.integer :lower_limit, null: false
      t.integer :upper_limit, null: false
    end
  end

end
