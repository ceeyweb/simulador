class KeepFormalWorkProbability

  INTERCEPT = 0.4123

  MARGINAL_AVERAGE_EFFECTS = {
    is_female: -0.083690,
    school_year: 0.023271,
    wealth_percentile: 0.000553,
    father_was_employed: -0.076062,
    father_had_formal_work: 0.116590,
    region_is_center_north: 0.035726,
    region_is_north: 0.103183,
    region_is_north_west: 0.049675,
    has_formal_work: 0.304610,
  }.freeze

  def initialize(work_user_kpis)
    @work_user_kpis = work_user_kpis
  end

  def value
    [[decimal_value * 100, 0].max, 100].min
  end

  private

  attr_reader :work_user_kpis

  def decimal_value
    MARGINAL_AVERAGE_EFFECTS.reduce(INTERCEPT) do |total, (element, value)|
      work_user_element = work_user_kpis[element].presence || 0

      total + (work_user_element * value)
    end
  end

end
