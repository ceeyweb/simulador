class EducationResults

  # TODO: rename `PARENTS_DIVIDER` with explicit name. This will be done as
  # soon as Analytics team shares more context about these value.
  PARENTS_DIVIDER = 18

  def initialize(user)
    @user = user
  end

  def education_achievement
    EducationAchievement.new(age, user.education_grade.school_year).value
  end

  def parents_education_achievement
    [(parents_average_school_year / PARENTS_DIVIDER), 1].min * 100
  end

  def sex_tertiles
    user.sex.education_achievement_tertiles
  end

  def region_tertiles
    user.region.education_achievement_tertiles
  end

  def age_tertiles
    user.age_group.education_achievement_tertiles
  end

  def user_sex_tertile
    sex_tertiles.tertile_for(education_achievement)
  end

  def user_region_tertile
    region_tertiles.tertile_for(education_achievement)
  end

  def user_age_tertile
    age_tertiles.tertile_for(education_achievement)
  end

  def average_income
    AverageIncome.new(
      user.sex_id,
      user.education_level.id,
      user.region.id,
    ).value
  end

  private

  attr_reader :user

  def age
    user.is_student ? user.age + 1 : user.age
  end

  def parents_average_school_year
    (user.father_education_grade.school_year +
     user.mother_education_grade.school_year).to_f / 2
  end

end
