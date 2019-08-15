FactoryBot.define do
  factory :kpis_education_achievement_age_tertile, class: "Kpis::EducationAchievementAgeTertile" do
    tertile { 2 }
    age_group
    lower_limit { 0.67 }
    upper_limit { 0.87 }
  end
end
