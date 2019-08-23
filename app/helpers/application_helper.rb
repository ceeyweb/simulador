module ApplicationHelper
  def simulator_user_image(education_level, user_education_level, sex, section)
    if user_education_level >= education_level
      image_tag("#{sex.downcase}_con_birrete_#{section}.png", class: "grad-image")
    else
      image_tag(
        "#{sex.downcase}_sin_birrete.png",
        id: "education-level-#{education_level}",
        class: "grad-image",
        style: "margin-top: 26px;",
      )
    end
  end
end
