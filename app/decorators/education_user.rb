class EducationUser < SimpleDelegator

  def education_results
    EducationResults.new(__getobj__)
  end

end
