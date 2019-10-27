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

  def kpis
    "life-expectancy"
  end

  def section
    "health"
  end

  private

  def results
    @results ||= HealthResults.new(__getobj__)
  end

end
