class HealthResults::SchoolYear

  def initialize(age, user_grade, father_grade, mother_grade)
    @age = age
    @user_grade = user_grade
    @father_grade = father_grade
    @mother_grade = mother_grade
  end

  def value
    if age >= 18
      user_grade.school_year
    elsif only_monther_with_education?
      mother_grade.school_year
    elsif only_father_with_education?
      father_grade.school_year
    else
      (mother_grade.school_year + father_grade.school_year) / 2
    end
  end

  private

  attr_reader :age, :user_grade, :father_grade, :mother_grade

  def only_mother_with_education?
    mother_grade.has_education? && !father_grade.has_education?
  end

  def only_father_with_education?
    father_grade.has_education? && !mother_grade.has_education?
  end

end
