class CreateJobSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :job_schedules do |t|
      t.string :description, null: false
    end
  end
end
