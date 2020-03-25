class AddParentsAliveToUsers < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :father_is_alive, :boolean, null: false
    add_column :users, :mother_is_alive, :boolean, null: false
  end

end
