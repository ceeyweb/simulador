class ResultsUser < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  SEX_TEXT = {
    Sex::FEMALE_ID => "las mujeres", Sex::MALE_ID => "los hombres"
  }.freeze

  delegate :complete_education_level, to: :education_grade

  def region
    super.description
  end

  def age_group
    super.description
  end

  def sex
    super.description
  end

  def sex_text
    SEX_TEXT[sex_id]
  end

  def education_level
    super.id
  end

  def slider_image
    "/images/sim_#{sex_id}_#{complete_education_level}.png"
  end

end
