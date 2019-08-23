class User < ApplicationRecord

  attr_writer :school_year

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

  before_validation :set_age_group

  delegate :education_level, to: :education_grade
  delegate :region, to: :residency

  def age
    return self[:age] if @school_year.nil?

    self[:age] + @school_year - education_grade.school_year
  end

  def student_age
    age + (is_student ? 1 : 0)
  end

  def school_year
    if age > 18
      @school_year || education_grade.school_year
    elsif mother_and_father_have_education?
      parents_average_school_year
    elsif mother_has_education?
      mother_school_year
    elsif father_has_education?
      father_school_year
    end
  end

  def parents_average_school_year
    (mother_school_year + father_school_year).to_f / 2
  end

  def mother_school_year
    mother_education_grade.school_year
  end

  def father_school_year
    father_education_grade.school_year
  end

  private

  def set_age_group
    self[:age_group_id] = AgeGroup.for(age)&.id
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

  def mother_and_father_have_education?
    mother_has_education? && father_has_education?
  end

  def mother_has_education?
    mother_education_grade.has_education?
  end

  def father_has_education?
    father_education_grade.has_education?
  end

end
