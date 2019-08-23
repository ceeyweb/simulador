class HealthResults < SimpleDelegator

  def expected_age
    LifeExpectancy.new(age, sex_id, residency_id, school_year).value
  end

  def mother_expected_age
    LifeExpectancy.new(
      mother_age,
      Sex::FEMALE_ID,
      mother_residency_id,
      mother_school_year,
    ).value
  end

  def father_expected_age
    LifeExpectancy.new(
      father_age,
      Sex::MALE_ID,
      father_residency_id,
      father_school_year,
    ).value
  end

  def world_expected_age
    Kpis::LifeExpectancyWorld.expected_age(age, sex_id)
  end

  def country_expected_age
    Kpis::LifeExpectancyCountry.expected_age(age, sex_id)
  end

  def region_expected_age
    Kpis::LifeExpectancyRegion.expected_age(age, sex_id, residency.region_id)
  end

end
