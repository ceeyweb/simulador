class HealthResults

  def initialize(user)
    @user = user
  end

  def expected_age
    LifeExpectancy.new(
      user.age,
      user.sex,
      user.residency_id,
      user.school_year,
    ).value
  end

  def mother_expected_age
    LifeExpectancy.new(
      user.mother_age,
      Sex.female,
      user.mother_residency_id,
      user.mother_education_grade.school_year,
    ).value
  end

  def father_expected_age
    LifeExpectancy.new(
      user.father_age,
      Sex.male,
      user.father_residency_id,
      user.father_education_grade.school_year,
    ).value
  end

  def world_expected_age
    Kpis::LifeExpectancyWorld.expected_age(user.age, user.sex_id)
  end

  def country_expected_age
    Kpis::LifeExpectancyCountry.expected_age(user.age, user.sex_id)
  end

  def region_expected_age
    Kpis::LifeExpectancyRegion.expected_age(
      user.age,
      user.sex_id,
      user.residency.region_id,
    )
  end

  def wellness
    # Update initialization values when formula is defined
    Wellness.new.value
  end

  private

  attr_reader :user

end
