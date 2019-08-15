FactoryBot.define do
  factory :kpis_education_achievement_sex_tertile, class: "Kpis::EducationAchievementSexTertile" do
    tertile { 2 }
    sex
    lower_limit { 0.75 }
    upper_limit { 0.99 }
  end
end
