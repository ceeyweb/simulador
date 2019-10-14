class WorkUser < SimpleDelegator

  include ActionView::Helpers::NumberHelper

  WorkResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  private

  def results
    WorkResults.new(__getobj__)
  end

end
