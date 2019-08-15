module Kpis::EducationAchievementTertileFilter
  def tertile_for(achievement)
    order(tertile: :DESC).
      find_by(
        "`lower_limit` <= ? AND `upper_limit` >= ?",
        achievement,
        achievement,
      ).tertile
  end
end
