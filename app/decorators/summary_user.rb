class SummaryUser < ResultsUser

  delegate :expected_age, to: :health_results
  delegate :education_achievement, to: :education_results
  delegate :average_income, to: :education_results
  delegate :work_probability, to: :work_results
  delegate :formal_work_probability, to: :work_results
  delegate :keep_formal_work_probability, to: :work_results

  private

  def health_results
    @health_results ||= HealthResults.new(__getobj__)
  end

  def education_results
    @education_results ||= EducationResults.new(__getobj__)
  end

  def work_results
    @work_results ||= WorkResults.new(__getobj__)
  end

end
