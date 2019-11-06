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

  def tertile_image(group = :sex)
    "education_books_#{tertile_label_for(send("user_#{group}_tertile"))}.png"
  end

  def education_achievement_title
    "¿Cuáles son tus logros educativos#{education_achievement_strings[:title]}?"
  end

  def education_achievement_text
    <<~TEXT.squish
      #{education_achievement_strings[:text_1]} el <span class="highlight">
      #{parents_education_achievement}%</span> de los logros
      educativos que #{education_achievement_strings[:text_2]} haber obtenido
    TEXT
  end

  def education_achievement_parents_text
    education_achievement_strings[:parents]
  end

  def education_achievement_col_offset_class
    "offset-md-3" unless mother_or_father_has_education?
  end

  private

  def education_achievement_strings
    @education_achievement_strings ||=
      if parents_have_education?
        {
          title: " y los de tus padres",
          text_1: "Tus padres tienen",
          text_2: "pudieran",
          parents: "tus padres",
        }
      elsif mother_has_education?
        {
          title: " y los de tu madre",
          text_1: "Tu madre tiene",
          text_2: "pudiera",
          parents: "tu madre",
        }
      elsif father_has_education?
        {
          title: " y los de tu padre",
          text_1: "Tu padre tiene",
          text_2: "pudiera",
          parents: "tu padre",
        }
      else
        {}
      end
  end

  def results
    @results ||= EducationResults.new(__getobj__)
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
