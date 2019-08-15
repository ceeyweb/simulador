class CreateKpisEducationAchievementAgeTertiles < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_education_achievement_age_tertiles, id: false do |t|
      t.integer :tertile, null: false
      t.references :age_group, null: false, foreign_key: true
      t.integer :lower_limit, null: false
      t.integer :upper_limit, null: false
    end
  end

end
