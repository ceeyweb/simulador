class JobSchedule < ApplicationRecord

  def is_na?
    id == 99
  end

end
