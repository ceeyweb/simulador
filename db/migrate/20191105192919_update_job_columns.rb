class UpdateJobColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :father_had_employees, :integer

    remove_column :users, :job_sector_id
    remove_column :users, :job_schedule_id
    remove_column :users, :job_type_id
    remove_column :users, :job_employees_group_id
    remove_column :users, :father_job_employees_group_id

    drop_table :job_sectors
    drop_table :job_schedules
    drop_table :job_employees_groups
  end
end
