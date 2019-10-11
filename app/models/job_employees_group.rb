class JobEmployeesGroup < ApplicationRecord

  NO_EMPLOYEES_ID = 0

  def has_employees?
    id == NO_EMPLOYEES_ID
  end

end
