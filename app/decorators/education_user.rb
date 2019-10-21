class EducationUser < ResultsUser

  EducationResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  def kpis
    "education-achievement,average-income"
  end

  def section
    "education"
  end

  private

  def results
    @results ||= EducationResults.new(__getobj__)
  end

end
