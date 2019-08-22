class EducationResults < SimpleDelegator

  # TODO: rename `PARENTS_DIVIDER` with explicit name. This will be done as
  # soon as Analytics team shares more context about these value.
  PARENTS_DIVIDER = 18

  def education_achievement
    EducationAchievement.new(user_age, education_grade.school_year).value
  end

  def parents_education_achievement
    [(parents_average_school_year / PARENTS_DIVIDER), 1].min * 100
  end

  def sex_tertiles
    sex.education_achievement_tertiles
  end

  def region_tertiles
    region.education_achievement_tertiles
  end

  def age_tertiles
    age_group.education_achievement_tertiles
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
    AverageIncome.new(sex_id, education_level.id, region.id).value
  end

  private

  def user_age
    is_student ? age + 1 : age
  end

end
