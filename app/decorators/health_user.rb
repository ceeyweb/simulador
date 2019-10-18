class HealthUser < SimpleDelegator

  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::AssetTagHelper

  SEX_TEXT = {
    Sex::FEMALE_ID => "las mujeres", Sex::MALE_ID => "los hombres"
  }.freeze

  HealthResults.instance_methods(false).each do |method|
    define_method(method) do
      number_with_precision(
        results.public_send(method),
        precision: 0,
      )
    end
  end

  def currently_works?
    false
  end

  def region
    super.description
  end

  def region_states
    __getobj__.
      region.states.
      pluck(:description).
      join(", ").
      reverse.
      sub(",", "y ").
      reverse
  end

  def age_group
    super.description
  end

  def expected_age_image
    "esperanza_vida_#{sex.downcase}.png"
  end

  def region_map_image
    "mapa_region_#{region.tr(" ", "_").downcase}.png"
  end

  def sex
    super.description
  end

  def sex_text
    SEX_TEXT[sex_id]
  end

  def education_level
    super.id
  end

  private

  def results
    @results ||= HealthResults.new(__getobj__)
  end

end
