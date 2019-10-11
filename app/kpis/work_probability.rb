class WorkProbability

  MARGINAL_AVERAGE_EFFECTS = {
    is_female: -0.393134,
    is_older_than_45: 0.012786,
    school_year: 0.014380,
    father_was_employed: -0.016267,
    father_had_employees: 0.026570,
    father_had_formal_work: 0.021948,
    region_is_center_north: -0.032543,
    region_is_north: -0.029650,
    region_is_south: -0.062197,
    region_is_north_west: -0.061839,
  }.freeze

  def initialize(work_user_kpis)
    @work_user_kpis = work_user_kpis
  end

  def value
    MARGINAL_AVERAGE_EFFECTS.reduce(0) do |total, (element, value)|
      work_user_element = work_user_kpis[element].presence || 0

      total + work_user_element * value * 100
    end
  end

  private

  attr_reader :work_user_kpis

end
