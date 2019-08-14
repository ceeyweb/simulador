class Kpis::LifeExpectancyWorld < ApplicationRecord

  self.table_name = "kpis_life_expectancies_world"

  def self.expected_age(age, sex_id)
    find_by(age: age, sex_id: sex_id).expected_age
  end

end
