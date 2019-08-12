FactoryBot.define do
  factory :age_group do
    description { "18 a 23 años" }
    lower_limit { 18 }
    upper_limit { 23 }
  end
end
