class AddHomeHadWasherToUsers < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :home_had_washer, :integer
  end

end
