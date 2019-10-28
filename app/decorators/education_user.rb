class EducationUser < ResultsUser

  EducationResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  def kpis
    "education-achievement,average-income"
  end

  def section
    "education"
  end

  def education_achievement_image
    "#{image_for(education_achievement.to_i)}.png"
  end

  def parents_education_achievement_image
    "#{image_for(parents_education_achievement.to_i)}.png"
  end

  def tertile_low
  end

  private

  def results
    @results ||= EducationResults.new(__getobj__)
  end

  def image_for(achievement_score)
    if achievement_score <= 33
      "bajo"
    elsif achievement_score <= 66
      "medio"
    else
      "alto"
    end
  end

end
