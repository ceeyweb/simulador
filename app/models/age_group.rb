class AgeGroup < ApplicationRecord

  def self.for(age)
    find_by("`lower_limit` <= ? AND `upper_limit` >= ?", age, age)
  end

end
