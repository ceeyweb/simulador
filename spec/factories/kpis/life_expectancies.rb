FactoryBot.define do
  factory :kpis_life_expectancy, class: "Kpis::LifeExpectancy" do
    age { 18 }
    sex
    state
    expected_age { 61.35526 }
    state_school_year { 11.48718 }
  end
end
