FactoryBot.define do
  factory :user do
    ip_address { "0.0.0.0" }
    father_age { 50 }
    association :father_residency, factory: :state
    association :father_education_grade, factory: :education_grade
    mother_age { 45 }
    association :mother_residency, factory: :state
    association :mother_education_grade, factory: :education_grade
    age { 18 }
    association :residency, factory: :state
    sex
    education_grade
    is_student { true }

    before(:create) do
      create(:age_group)
    end
  end
end
