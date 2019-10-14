class Kpis::WorkParticipationRate < ApplicationRecord

  scope :male,   ->             { where(sex_id: Sex::MALE_ID) }
  scope :female, ->             { where(sex_id: Sex::FEMALE_ID) }
  scope :region, -> (region_id) { where(region_id: region_id) }

  def self.age(age)
    where("`age_lower_limit` <= ? AND `age_upper_limit` >= ?", age, age)
  end

end
