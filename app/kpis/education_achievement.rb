class EducationAchievement

  PRESCHOOL_YEARS = 5
  MAX_TSE = 14
  TSE_AGE_LIMIT = 24

  def initialize(age, school_year, is_student)
    @age = age
    @school_year = school_year
    @is_student = is_student
  end

  def value
    [school_year / tse.to_f, 1].min * 100
  end

  private

  attr_reader :age, :is_student

  def tse
    return MAX_TSE if age > TSE_AGE_LIMIT

    age - PRESCHOOL_YEARS
  end

  def school_year
    @school_year + (is_student ? 1 : 0)
  end

end
