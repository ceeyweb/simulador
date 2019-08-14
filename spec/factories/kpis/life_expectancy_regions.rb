FactoryBot.define do
  factory :kpis_life_expectancy_region, class: "Kpis::LifeExpectancyRegion" do
    age { 18 }
    sex
    region
    expected_age { 79.35526 }
  end
end
