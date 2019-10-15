namespace :data do
  namespace :load do

    desc "Load all 'Kpis' tables"
    task all: :environment do
      puts "Loading tables..."

      KpisLoader.load_all do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

    desc "Load health related 'Kpis' tables"
    task health: :environment do
      puts "Loading tables..."

      KpisLoader.load(:health) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

    desc "Load education related 'Kpis' tables"
    task education: :environment do
      puts "Loading tables..."

      KpisLoader.load(:education) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

    desc "Load work related 'Kpis' tables"
    task work: :environment do
      puts "Loading tables..."

      KpisLoader.load(:work) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

  end
end
