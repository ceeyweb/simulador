class EducationAchievement

  PRESCHOOL_YEARS = 5

  def initialize(age, school_year, future_school_year = nil)
    @age = age
    @school_year = school_year
    @future_school_year = future_school_year || school_year
  end

  def value
    [future_school_year / (future_age - PRESCHOOL_YEARS).to_f, 1].min * 100
  end

  private

  attr_reader :age, :school_year, :future_school_year

  def future_age
    age + future_school_year - school_year
  end

end
