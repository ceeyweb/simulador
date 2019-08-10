class EducationLevel < ApplicationRecord

  has_many :education_grades, dependent: :destroy

end
