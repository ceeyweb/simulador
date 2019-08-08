class User < ApplicationRecord

  validates :ip_address,
            :age_id,
            :residency_id,
            :grade_id,
            :sex,
            presence: true

  validates :age_id,
            :father_age_id,
            :mother_age_id,
            numericality: { greater_than_or_equal_to: 0, less_than: 100 }
  validates :do_you_go_to_school, inclusion: [0, 1, 2]

  validate :disallow_changing_values_after_create

  private

  def disallow_changing_values_after_create
    if persisted? && (father_age_id_changed? ||
      father_residency_id_changed? ||
      father_grade_id_changed? ||
      mother_age_id_changed? ||
      mother_residency_id_changed? ||
      mother_grade_id_changed? ||
      age_id_changed? ||
      residency_id_changed? ||
      grade_id_changed?)
      errors.add(:base, "Can't change attribute")
    end
  end

end
