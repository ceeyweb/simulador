class User < ApplicationRecord

  before_validation :set_age_group

  validates :ip_address,
            :father_age,
            :mother_age,
            :age,
            :is_student,
            presence: true

  validates :age, numericality: { greater_than_or_equal_to: 0, less_than: 100 }

  validates :father_age,
            :mother_age,
            numericality: { greater_than_or_equal_to: 15, less_than: 100 }

  validate :disallow_changing_values_after_create

  belongs_to :father_residency, class_name: "State"
  belongs_to :father_education_grade, class_name: "EducationGrade"
  belongs_to :mother_residency, class_name: "State"
  belongs_to :mother_education_grade, class_name: "EducationGrade"
  belongs_to :age_group
  belongs_to :residency, class_name: "State"
  belongs_to :sex
  belongs_to :education_grade
  belongs_to :father_job_type, class_name: "JobType", optional: true
  belongs_to :father_job_employees_group, class_name: "JobEmployeesGroup",
             optional: true
  belongs_to :mother_job_type, class_name: "JobType", optional: true
  belongs_to :mother_job_employees_group, class_name: "JobEmployeesGroup",
             optional: true
  belongs_to :job_type, optional: true
  belongs_to :job_employees_group, optional: true
  belongs_to :job_schedule, optional: true
  belongs_to :job_sector, optional: true

  delegate :education_level, to: :education_grade
  delegate :region, to: :residency

  def school_year
    if age > 18
      education_grade.school_year
    elsif only_mother_has_education?
      mother_education_grade.school_year
    elsif only_father_has_education?
      father_education_grade.school_year
    else
      (mother_education_grade.school_year +
       father_education_grade.school_year) / 2
    end
  end

  private

  def set_age_group
    self["age_group_id"] = AgeGroup.for(age)&.id
  end

  def disallow_changing_values_after_create
    if persisted? && (father_age_changed? ||
      father_residency_id_changed? ||
      father_education_grade_id_changed? ||
      mother_age_changed? ||
      mother_residency_id_changed? ||
      mother_education_grade_id_changed? ||
      age_changed? ||
      residency_id_changed? ||
      education_grade_id_changed?)
      errors.add(:base, "Can't change attribute")
    end
  end

  def only_mother_has_education?
    mother_education_grade.has_education? &&
      !father_education_grade.has_education?
  end

  def only_father_has_education?
    father_education_grade.has_education? &&
      !mother_education_grade.has_education?
  end

end
