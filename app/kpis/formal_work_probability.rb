class FormalWorkProbability

  MARGINAL_AVERAGE_EFFECTS = {
    is_older_than_45: 0.079415,
    school_year: 0.024031,
    wealth_percentile: 0.001514,
    father_was_employed: -0.079728,
    father_had_employees: -0.039930,
    father_had_formal_work: 0.185052,
    region_is_center_north: -0.031114,
    region_is_north: 0.165543,
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
