class Kpis::LifeExpectancyRegion < ApplicationRecord

  self.table_name = "kpis_life_expectancies_region"

  def self.expected_age(age, sex_id, region_id)
    find_by(age: age, sex_id: sex_id, region_id: region_id).expected_age
  end

end
