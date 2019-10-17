class EducationUser < SimpleDelegator

  include ActionView::Helpers::NumberHelper
 
  EducationResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  private

  def results
    EducationResults.new(__getobj__)
  end

end
