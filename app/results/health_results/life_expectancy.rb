class HealthResults::LifeExpectancy

  # TODO: rename `SEX_MODIFIER_1` and `SEX_MODIFIER_2` (and related methods)
  # with more explicit names. This will be done as soon as Analytics team
  # shares more context about these values.
  SEX_MODIFIER_1 = { Sex::FEMALE_ID => 0.25, Sex::MALE_ID => 0.28 }.freeze
  SEX_MODIFIER_2 = { Sex::FEMALE_ID => 0.06, Sex::MALE_ID => 1.99 }.freeze

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
    SEX_MODIFIER_1[sex.id]
  end

  def sex_modifier_2
    SEX_MODIFIER_2[sex.id]
  end

  def kpis_life_expectancy
    @kpis_life_expectancy ||= Kpis::LifeExpectancy.find_by(
      age: future_age,
      sex_id: sex.id,
      state_id: state_id,
    )
  end

end
