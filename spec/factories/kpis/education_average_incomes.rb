FactoryBot.define do
  factory :kpis_education_average_income, class: "Kpis::EducationAverageIncome" do
    sex
    education_level
    region
    average_income { 7609 }
  end
end
