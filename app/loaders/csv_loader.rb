require "csv"

class CSVLoader < ApplicationLoader

  def initialize(model)
    @model = model
  end

  def load
    model.delete_all
    model.connection.execute(insert)

    true
  end

  private

  attr_reader :model

  def insert
    <<~SQL.squish
      INSERT INTO `#{model.table_name}` (`#{columns.join('`, `')}`)
      VALUES #{values.join(', ')}
    SQL
  end

  def values
    CSV.foreach(file, headers: true).map do |row|
      "(#{row.to_hash.values.join(',')})"
    end
  end

  def file
    Rails.root.join("db", "data", "#{model.table_name}.csv")
  end

  def columns
    CSV.open(file, "r") do |csv|
      csv.first
    end
  end

end
