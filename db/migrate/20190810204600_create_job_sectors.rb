class CreateJobSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :job_sectors do |t|
      t.string :description, null: false
    end
  end
end
