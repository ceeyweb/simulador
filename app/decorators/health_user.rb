class HealthUser < SimpleDelegator

  def health_results
    HealthResults.new(__getobj__)
  end

end
