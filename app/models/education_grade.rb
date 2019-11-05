class EducationGrade < ApplicationRecord

  NO_RESPONSE_ID = 99

  belongs_to :education_level

  scope :without_blank, -> { where.not(id: NO_RESPONSE_ID) }

  def no_response?
    id == NO_RESPONSE_ID
  end

end
