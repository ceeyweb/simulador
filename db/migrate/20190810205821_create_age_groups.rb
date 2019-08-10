class CreateAgeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :age_groups do |t|
      t.string :description, null: false
      t.integer :lower_limit, null: false
      t.integer :upper_limit, null: false
    end
  end
end
