class CreateJobEmployeesGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :job_employees_groups do |t|
      t.string :description, null: false
    end
  end
end
