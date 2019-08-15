FactoryBot.define do
  factory :kpis_education_achievement_region_tertile, class: "Kpis::EducationAchievementRegionTertile" do
    tertile { 2 }
    region
    lower_limit { 0.80 }
    upper_limit { 0.99 }
  end
end
