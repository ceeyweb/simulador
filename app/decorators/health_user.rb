class HealthUser < ResultsUser

  HealthResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  def region_states
    __getobj__.
      region.states.
      pluck(:description).
      join(", ").
      reverse.
      sub(",", "y ").
      reverse
  end

  def expected_age_image
    "esperanza_vida_#{sex.downcase}.png"
  end

  def region_map_image
    "mapa_#{region.tr(" ", "_").downcase}.png"
  end

  def expected_age_question_text
    default = "Cuántos años en total se espera que vivan tú y"

    if mother_age.present? && father_age.present?
      "#{default} tus padres"
    elsif mother_age.present?
      "#{default} tu madre"
    elsif father_age.present?
      "#{default} tu padre"
    else
      "Cuántos años en total se espera que vivas"
    end
  end

  def kpis
    "life-expectancy"
  end

  def section
    "health"
  end

  def expected_age_col_offset_class
    if !father_has_expected_age? && !mother_has_expected_age?
      "offset-4"
    elsif !father_has_expected_age? || !mother_has_expected_age?
      "offset-2"
    end
  end

  def father_has_expected_age?
    father_expected_age.present?
  end

  def mother_has_expected_age?
    mother_expected_age.present?
  end

  def mother_or_father_have_expected_age?
    mother_has_expected_age? || father_has_expected_age?
  end

  private

  def results
    @results ||= HealthResults.new(__getobj__)
  end

end
