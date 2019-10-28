module Kpis::EducationAchievementTertileFilter
  def tertile_for(achievement)
    select(:tertile).
      order(tertile: :DESC).
      find_by(
        "`lower_limit` <= ? AND `upper_limit` >= ?",
        achievement,
        achievement,
      ).tertile
  end

  def low
    find_by(tertile: 1)
  end

  def medium
    find_by(tertile: 2)
  end

  def high
    find_by(tertile: 3)
  end
end
