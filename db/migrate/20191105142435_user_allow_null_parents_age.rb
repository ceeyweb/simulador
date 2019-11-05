class UserAllowNullParentsAge < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :father_age, true
    change_column_null :users, :mother_age, true
  end
end
