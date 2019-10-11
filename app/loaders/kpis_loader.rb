class KpisLoader < ApplicationLoader

  class KpisNotFoundError < StandardError; end

  MODELS = {
    health: [
      Kpis::LifeExpectancy,
      Kpis::LifeExpectancyCountry,
      Kpis::LifeExpectancyRegion,
      Kpis::LifeExpectancyWorld,
    ],
    education: [
      Kpis::EducationAchievementAgeTertile,
      Kpis::EducationAchievementRegionTertile,
      Kpis::EducationAchievementSexTertile,
      Kpis::EducationAverageIncome,
    ],
  }.freeze

  def self.load_all
    MODELS.each_key do |kpis|
      load(kpis)
    end

    true
  end

  def initialize(kpis)
    @kpis = kpis

    raise KpisNotFoundError, "KPIs for `#{kpis}' not found." unless kpis_exist?
  end

  def load
    models.each do |model|
      CSVLoader.load(model)

      yield model if block_given?
    end

    true
  end

  private

  attr_reader :kpis

  def models
    MODELS.values_at(kpis).first
  end

  def kpis_exist?
    MODELS.key?(kpis)
  end

end
