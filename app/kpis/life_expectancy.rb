class LifeExpectancy

  EDUCATION_GRADE_COEFFICIENT = {
    Sex::FEMALE_ID => 0.25,
    Sex::MALE_ID => 0.28,
  }.freeze

  REGRESSION_BETA_WEIGHT = {
    Sex::FEMALE_ID => 0.06,
    Sex::MALE_ID => 1.99,
  }.freeze

  def initialize(age, sex_id, state_id, school_year)
    @age = age
    @sex_id = sex_id
    @state_id = state_id
    @school_year = school_year || state_school_year
  end

  def value
    age +
      life_expectancy +
      education_grade_coefficient *
      (school_year - state_school_year) +
      regression_beta_weight
  end

  private

  attr_reader :age, :sex_id, :state_id, :school_year

  def life_expectancy
    kpis_life_expectancy.expected_age
  end

  def state_school_year
    kpis_life_expectancy.state_school_year
  end

  def education_grade_coefficient
    EDUCATION_GRADE_COEFFICIENT[sex_id]
  end

  def regression_beta_weight
    REGRESSION_BETA_WEIGHT[sex_id]
  end

  def kpis_life_expectancy
    @kpis_life_expectancy ||= Kpis::LifeExpectancy.find_by(
      age: age,
      sex_id: sex_id,
      state_id: state_id,
    )
  end

end
