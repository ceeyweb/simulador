class Region < ApplicationRecord

  REGION_IDS = {
    north: 1,
    north_west: 2,
    center_north: 3,
    center: 4,
    south: 5,
  }.freeze

  has_many :states, dependent: :destroy
  has_many :education_achievement_tertiles,
           class_name: "Kpis::EducationAchievementRegionTertile",
           dependent: :delete_all

  def north?
    id == REGION_IDS[:north]
  end

  def north_west?
    id == REGION_IDS[:north_west]
  end

  def center_north?
    id == REGION_IDS[:center_north]
  end

  def center?
    id == REGION_IDS[:center]
  end

  def south?
    id == REGION_IDS[:south]
  end

end
