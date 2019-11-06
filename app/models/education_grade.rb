class EducationGrade < ApplicationRecord

  NO_RESPONSE_ID = 99

  belongs_to :education_level

  scope :without_blank, -> { where.not(id: NO_RESPONSE_ID) }

  def no_response?
    id == NO_RESPONSE_ID
  end

  def complete_education_level
    if education_level.max_school_year == school_year
      education_level_id
    else
      education_level_id - 1
    end
  end

end
