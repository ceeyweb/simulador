class EducationGrade < ApplicationRecord

  NO_RESPONSE_ID = 99

  belongs_to :education_level

  def has_education?
    id != NO_RESPONSE_ID
  end

end
