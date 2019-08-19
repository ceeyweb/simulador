require Rails.root.join("lib", "csv_loader")

namespace :data do
  namespace :health do

    desc "Load all health related 'Kpis' tables"
    task load_all: :environment do
      puts "Loading tables..."

      LoadKpis.call(:health) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

  end

  namespace :education do

    desc "Load all education related 'Kpis' tables"
    task load_all: :environment do
      puts "Loading tables..."

      LoadKpis.call(:education) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

  end
end
