class EducationLevel < ApplicationRecord

  NO_EDUCATION_ID = 0
  NO_RESPONSE_ID = 99

  has_many :education_grades, dependent: :destroy

  scope :with_education, -> { where.not(id: [NO_EDUCATION_ID, NO_RESPONSE_ID]) }

  def max_school_year
    education_grades.maximum(:school_year)
  end

end
