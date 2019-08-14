class HealthResults::LifeExpectancy

  def initialize(age, sex, state_id, school_year, future_school_year = nil)
    @age = age
    @sex = sex
    @state_id = state_id
    @school_year = school_year
    @future_school_year = future_school_year || school_year
  end

  def value
    future_age +
      life_expectancy +
      sex_modifier_1 *
      (school_year - state_school_year) +
      sex_modifier_2
  end

  private

  attr_reader :age, :sex, :state_id, :school_year, :future_school_year

  def future_age
    age + future_school_year - school_year
  end

  def life_expectancy
    kpis_life_expectancy.expected_age
  end

  def state_school_year
    kpis_life_expectancy.state_school_year
  end

  def sex_modifier_1
    sex.female? ? 0.25 : 0.28
  end

  def sex_modifier_2
    sex.female? ? 0.06 : 1.99
  end

  def kpis_life_expectancy
    @kpis_life_expectancy ||= Kpis::LifeExpectancy.find_by(
      age: future_age,
      sex_id: sex.id,
      state_id: state_id,
    )
  end

end
