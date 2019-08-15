class AgeGroup < ApplicationRecord

  has_many :education_achievement_tertiles,
           class_name: "Kpis::EducationAchievementAgeTertile",
           dependent: :delete_all

  def self.for(age)
    find_by("`lower_limit` <= ? AND `upper_limit` >= ?", age, age)
  end

end
