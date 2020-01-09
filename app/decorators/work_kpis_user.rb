class WorkKpisUser < SimpleDelegator

  INTERCEPT = 4.048188

  COEFFICIENTS = {
    home_had_mobile_phone: 7.138074,
    home_had_fixed_phone: 9.30827,
    home_had_internet: 4.466409,
    home_had_stove: 8.60786,
    home_had_washer: 9.83051,
    home_had_fridge: 9.363007,
    home_had_heater: 9.022016,
    home_had_toaster: 6.505989,
    home_had_water: 8.594496,
    home_had_bathroom: 8.75756,
    home_had_electricity: 9.172113,
    parents_average_school_year: 0.934829,
  }.freeze

  KPIS_ELEMENTS = [
    :is_female,
    :is_older_than_45,
    :school_year,
    :wealth_percentile,
    :father_was_employed,
    :father_had_employees,
    :father_had_formal_work,
    :region_is_center_north,
    :region_is_north,
    :region_is_south,
    :region_is_north_west,
    :has_formal_work,
  ].freeze

  NA_ELEMENTS = [
    :father_was_employed,
    :father_had_employees,
    :father_had_formal_work,
  ].freeze

  def kpis
    KPIS_ELEMENTS.each_with_object({}) do |element, result|
      kpi = send(element)
      kpi = 0 if NA_ELEMENTS.include?(element) && kpi != 1

      result[element] = kpi.to_f
    end
  end

  private

  def is_female
    sex.female? ? 1 : 0
  end

  def is_older_than_45
    age > 45 ? 1 : 0
  end

  def wealth_percentile
    COEFFICIENTS.reduce(INTERCEPT) do |total, (key, value)|
      kpi = send(key)
      kpi = 0 unless key == :parents_average_school_year || kpi == 1

      total + kpi * value
    end
  end

  def father_was_employed
    father_job_type.employed? ? 1 : 0
  end

  def father_had_formal_work
    father_has_healthcare
  end

  def region_is_center_north
    region_is(:center_north)
  end

  def region_is_north
    region_is(:north)
  end

  def region_is_south
    region_is(:south)
  end

  def region_is_north_west
    region_is(:north_west)
  end

  def has_formal_work
    has_healthcare ? 1 : 0
  end

  def region_is(name)
    region.send("#{name}?") ? 1 : 0
  end

  def school_year
    super(false)
  end
end
