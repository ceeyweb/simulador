class Region < ApplicationRecord

  has_many :states, dependent: :destroy
  has_many :education_achievement_tertiles,
           class_name: "Kpis::EducationAchievementRegionTertile",
           dependent: :delete_all

end
