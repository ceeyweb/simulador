class RemoveMotherColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mother_is_employed
    remove_column :users, :mother_has_healthcare
    remove_column :users, :mother_job_type_id
    remove_column :users, :mother_job_employees_group_id
  end
end
