# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do
  User.create!(
    ip_address: 1,
    father_age_id: 1,
    father_residency_id: 1,
    father_grade_id: 1,
    mother_age_id: 1,
    mother_residency_id: 1,
    mother_grade_id: 1,
    age_id: 1,
    residency_id: 1,
    grade_id: 1,
    sex: 1,
    do_you_go_to_school: 1,
  )
end
