namespace :data do
  namespace :health do

    desc "Load all health related 'Kpis' tables"
    task load_all: :environment do
      puts "Loading tables..."

      KpisLoader.load(:health) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

  end

  namespace :education do

    desc "Load all education related 'Kpis' tables"
    task load_all: :environment do
      puts "Loading tables..."

      KpisLoader.load(:education) do |model|
        puts " > #{model.table_name}"
      end

      puts "...complete!"
    end

  end
end
