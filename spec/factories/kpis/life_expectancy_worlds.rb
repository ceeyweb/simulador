FactoryBot.define do
  factory :kpis_life_expectancy_world, class: "Kpis::LifeExpectancyWorld" do
    age { 18 }
    sex
    expected_age { 88.21771 }
  end
end
