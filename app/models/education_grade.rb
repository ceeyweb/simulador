class EducationGrade < ApplicationRecord

  NO_RESPONSE_ID = 99

  belongs_to :education_level

  scope :without_no_response, -> { where.not(id: NO_RESPONSE_ID) }

  def has_education?
    id != NO_RESPONSE_ID
  end

end
