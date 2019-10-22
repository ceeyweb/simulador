class WorkUser < ResultsUser

  WorkResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  def kpis
    if is_employed?
      "keep-formal-work-probability"
    else
      "work-probability,formal-work-probability"
    end
  end

  def section
    "work"
  end

  private

  def results
    @results ||= WorkResults.new(__getobj__)
  end

end
