class EducationResults::AverageIncome

  def initialize(sex_id, education_level_id, region_id)
    @sex_id = sex_id
    @education_level_id = education_level_id
    @region_id = region_id
  end

  def value
    Kpis::EducationAverageIncome.find_by(
      sex_id: sex_id,
      education_level_id: education_level_id,
      region_id: region_id,
    ).average_income
  end

  private

  attr_reader :sex_id, :education_level_id, :region_id

end
