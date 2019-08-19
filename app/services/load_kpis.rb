require Rails.root.join("lib", "csv_loader")

class LoadKpis

  class KpisNotFoundError < StandardError; end

  def self.call(*args, &block)
    new(*args).call(&block)
  end

  def initialize(kpis = nil)
    @kpis = kpis

    raise KpisNotFoundError, "KPIs for `#{kpis}' not found." unless kpis_exist?
  end

  def call
    models.each do |model|
      CSVLoader.load(model)

      yield model if block_given?
    end

    true
  end

  private

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

  attr_reader :kpis

  def models
    if kpis.nil?
      MODELS.values.flatten
    else
      MODELS[kpis]
    end
  end

  def kpis_exist?
    kpis.nil? || MODELS.keys.include?(kpis)
  end

end
