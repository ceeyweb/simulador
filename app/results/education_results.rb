class EducationResults < SimpleDelegator

  PARENTS_EXPECTED_AVERAGE_SCHOOL_YEAR = 18

  def education_achievement
    @education_achievement ||=
      EducationAchievement.new(age, school_year).value
  end

  def parents_education_achievement
    return nil unless mother_or_father_has_education?
    return 66  unless parents_have_education?

    [
      (parents_average_school_year / PARENTS_EXPECTED_AVERAGE_SCHOOL_YEAR),
      1,
    ].min * 100
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
    AverageIncome.new(sex_id, complete_education_level, region.id).value
  end

  def mother_or_father_has_education?
    mother_has_education? || father_has_education?
  end

  private

  def sex_tertiles
    sex.education_achievement_tertiles.order(:tertile)
  end

  def region_tertiles
    region.education_achievement_tertiles
  end

  def age_tertiles
    age_group.education_achievement_tertiles
  end

  def school_year
    education_grade.school_year + (is_student ? 1 : 0)
  end

end
