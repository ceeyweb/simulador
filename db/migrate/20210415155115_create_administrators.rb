class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
    end

    add_index :administrators, :username, unique: true
  end
end
