class EducationResults::EducationAchievement

  # TODO: rename `AGE_MODIFIER` with explicit name. This will be done as soon
  # as Analytics team shares more context about these value.
  AGE_MODIFIER = 5

  def initialize(age, school_year, future_school_year = nil)
    @age = age
    @school_year = school_year
    @future_school_year = future_school_year || school_year
  end

  def value
    [future_school_year / (future_age - AGE_MODIFIER).to_f, 1].min * 100
  end

  private

  attr_reader :age, :school_year, :future_school_year

  def future_age
    age + future_school_year - school_year
  end

end
