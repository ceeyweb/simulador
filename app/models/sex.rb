class Sex < ApplicationRecord

  FEMALE_ID = 1
  MALE_ID = 2

  has_many :education_achievement_tertiles,
           class_name: "Kpis::EducationAchievementSexTertile",
           dependent: :delete_all

  def self.female
    find(FEMALE_ID)
  end

  def self.male
    find(MALE_ID)
  end

end
