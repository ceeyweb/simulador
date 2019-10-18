class WorkResults < SimpleDelegator

  def lose_formal_work_probability
    transition_kpis.lose_formal_work_probability * 100
  end

  def keep_informal_work_probability
    transition_kpis.keep_informal_work_probability * 100
  end

  def keep_formal_work_probability
    KeepFormalWorkProbability.new(work_kpis_user).value
  end

  def work_probability
    WorkProbability.new(work_kpis_user).value
  end

  def formal_work_probability
    FormalWorkProbability.new(work_kpis_user).value
  end

  def mother_work_participation_rate
    mother_kpis.participation_rate
  end

  def mother_formal_work_participation_rate
    mother_kpis.formal_participation_rate
  end

  def father_work_participation_rate
    father_kpis.participation_rate
  end

  def father_formal_work_participation_rate
    father_kpis.formal_participation_rate
  end

  private

  def transition_kpis
    @transition_kpis ||= Kpis::WorkTransitionProbability.state(residency_id)
  end

  def mother_kpis
    @mother_kpis ||=
      Kpis::WorkParticipationRate.
        female.
        age(mother_age).
        region(mother_residency.region_id).
        first
  end

  def father_kpis
    @father_kpis ||=

      Kpis::WorkParticipationRate.
        male.
        age(father_age).
        region(father_residency.region_id).
        first
  end

  def work_kpis_user
    @work_kpis_user ||= WorkKpisUser.new(__getobj__).kpis
  end

end
