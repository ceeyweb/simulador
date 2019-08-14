class Sex < ApplicationRecord

  FEMALE_ID = 1
  MALE_ID = 2

  def self.female
    find(FEMALE_ID)
  end

  def self.male
    find(MALE_ID)
  end

  def female?
    id == FEMALE_ID
  end

  def male?
    id == MALE_ID
  end

end
