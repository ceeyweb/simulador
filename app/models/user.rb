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
  belongs_to :institution

  validates :ip_address,
            :age,
            :institution_id,
            :residency_id,
            :education_grade_id,
            :sex_id,
            presence: true

  validates :father_residency_id,
            :father_education_grade_id,
            presence: true,
            if: :father_is_alive

  validates :mother_residency_id,
            :mother_education_grade_id,
            presence: true,
            if: :mother_is_alive

  validates :is_student,
            :father_is_alive,
            :mother_is_alive,
            inclusion: { in: [true, false] }

  validates :father_age,
            :mother_age,
            numericality: { greater_than_or_equal_to: 15, less_than: 100, allow_blank: true }

  validates :age, numericality: { greater_than: 14, less_than: 25, allow_blank: true }

  validate :disallow_changing_values_after_create

  before_validation :set_age_group

  delegate :education_level, to: :education_grade
  delegate :complete_education_level, to: :education_grade
  delegate :region, to: :residency

  def father_age=(value)
    value = nil if value.to_i.zero?

    super(value)
  end

  def mother_age=(value)
    value = nil if value.to_i.zero?

    super(value)
  end

  def father_residency_id=(value)
    value = State::NO_RESPONSE_ID unless father_is_alive

    super(value)
  end

  def mother_residency_id=(value)
    value = State::NO_RESPONSE_ID unless mother_is_alive

    super(value)
  end

  def father_education_grade_id=(value)
    value = EducationGrade::NO_RESPONSE_ID unless father_is_alive

    super(value)
  end

  def mother_education_grade_id=(value)
    value = EducationGrade::NO_RESPONSE_ID unless mother_is_alive

    super(value)
  end

  def age
    return self[:age] if @school_year.nil?

    self[:age] + @school_year - education_grade.school_year
  end

  def school_year(restricted: false)
    if age > 18 || !restricted
      @school_year || education_grade.school_year
    elsif parents_have_education?
      parents_average_school_year
    elsif mother_has_education?
      mother_school_year
    elsif father_has_education?
      father_school_year
    end
  end

  def parents_average_school_year
    if father_has_education? && mother_has_education?
      (mother_school_year + father_school_year).to_f / 2
    elsif father_has_education?
      father_school_year
    elsif mother_has_education?
      mother_school_year
    end
  end

  def mother_school_year
    mother_education_grade.school_year
  end

  def father_school_year
    father_education_grade.school_year
  end

  def parents_have_education?
    mother_has_education? && father_has_education?
  end

  def mother_has_education?
    !mother_education_grade.no_response?
  end

  def father_has_education?
    !father_education_grade.no_response?
  end

  def preteen?
    age <= 14
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

end
