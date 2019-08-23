class EducationAchievement

  PRESCHOOL_YEARS = 5

  def initialize(age, school_year)
    @age = age
    @school_year = school_year
  end

  def value
    [school_year / (age - PRESCHOOL_YEARS).to_f, 1].min * 100
  end

  private

  attr_reader :age, :school_year

end
