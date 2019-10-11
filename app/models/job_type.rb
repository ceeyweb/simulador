class JobType < ApplicationRecord

  JOB_TYPE_IDS = {
    laborer: 1,
    employee: 2,
    boss: 3,
    self_employed: 4,
  }.freeze

  def employed?
    laborer? || employee?
  end

  def laborer?
    id == JOB_TYPE_IDS[:laborer]
  end

  def employee?
    id == JOB_TYPE_IDS[:employee]
  end

  def boss?
    id == JOB_TYPE_IDS[:boss]
  end

  def self_employed?
    id == JOB_TYPE_IDS[:self_employed]
  end

end
