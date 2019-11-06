class WorkResults < SimpleDelegator

  MOTHER_DEFAULT_AGE = 45
  FATHER_DEFAULT_AGE = 50

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
        region(mother_region_id).
        first
  end

  def father_kpis
    @father_kpis ||=
      Kpis::WorkParticipationRate.
        male.
        age(father_age).
        region(father_region_id).
        first
  end

  def work_kpis_user
    @work_kpis_user ||= WorkKpisUser.new(__getobj__).kpis
  end

  def father_age
    return FATHER_DEFAULT_AGE if super.nil?

    super
  end

  def mother_age
    return MOTHER_DEFAULT_AGE if super.nil?

    super
  end

  def mother_region_id
    return region.id if mother_residency.no_response?

    mother_residency.region_id
  end

  def father_region_id
    return region.id if father_residency.no_response?

    father_residency.region_id
  end

end
