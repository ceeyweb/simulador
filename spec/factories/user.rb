FactoryBot.define do
  factory :user do
    ip_address { "0.0.0.0" }
    father_age { 50 }
    father_residency_id { 7 }
    father_education_grade_id { 7 }
    mother_age { 45 }
    mother_residency_id { 7 }
    mother_education_grade_id { 7 }
    age { 18 }
    residency_id { 7 }
    sex_id { 2 }
    education_grade_id { 5 }
    is_student { true }
  end
end
