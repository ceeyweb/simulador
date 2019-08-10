class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :description, null: false
      t.references :region, null: false, foreign_key: true
    end
  end
end
