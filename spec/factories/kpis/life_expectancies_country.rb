FactoryBot.define do
  factory :kpis_life_expectancy_country, class: "Kpis::LifeExpectancyCountry" do
    age { 18 }
    sex
    expected_age { 79.59565 }
  end
end
