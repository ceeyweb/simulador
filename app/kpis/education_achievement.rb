class EducationAchievement

  PRESCHOOL_YEARS = 5
  MAX_TSE = 14
  TSE_AGE_LIMIT = 24

  def initialize(age, school_year)
    @age = age
    @school_year = school_year
  end

  def value
    [school_year / tse.to_f, 1].min * 100
  end

  private

  attr_reader :age, :school_year

  def tse
    return MAX_TSE if age > TSE_AGE_LIMIT

    age - PRESCHOOL_YEARS
  end

end
