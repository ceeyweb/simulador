require Rails.root.join("lib", "csv_loader")

namespace :data do
  namespace :health do

    desc "Load all health related 'Kpis' tables"
    task load_all: :environment do
      puts "Loading tables..."

      [
        Kpis::LifeExpectancy,
        Kpis::LifeExpectancyCountry,
        Kpis::LifeExpectancyRegion,
        Kpis::LifeExpectancyWorld,
      ].each do |model|
        puts " > #{model.table_name}"

        CSVLoader.load(model)
      end

      puts "...complete!"
    end

  end
end
