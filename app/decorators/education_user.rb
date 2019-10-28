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
    achievement_image_for(score_label_for(education_achievement.to_i))
  end

  def parents_education_achievement_image
    achievement_image_for(score_label_for(parents_education_achievement.to_i))
  end

  def tertile_legend(level, group = :sex)
    legend_for(sex_tertiles.first)
    legend_for(send("#{group}_tertiles").send(level))
  end

  def tertile_image(group = :sex)
    "education_books_#{tertile_label_for(send("user_#{group}_tertile"))}.png"
  end

  private

  def results
    @results ||= EducationResults.new(__getobj__)
  end

  def legend_for(tertile)
    if tertile.lower_limit == tertile.upper_limit
      "#{tertile.lower_limit}%"
    else
      "Entre #{tertile.lower_limit}% y #{tertile.upper_limit}%"
    end
  end

  def achievement_image_for(label)
    "education_achievement_#{label}.png"
  end

  def tertile_label_for(tertile)
    case tertile
    when "1" then :low
    when "2" then :medium
    when "3" then :high
    end
  end

  def score_label_for(achievement_score)
    if achievement_score <= 33
      :low
    elsif achievement_score <= 66
      :medium
    else
      :high
    end
  end

end
