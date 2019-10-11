class CreateKpisWorkTransitionProbabilities < ActiveRecord::Migration[5.2]

  def change
    create_table :kpis_work_transition_probabilities, id: false do |t|
      t.references :state, null: false, foreign_key: true
      t.float :keep_formal_work_probability, null: false
      t.float :change_to_informal_work_probability, null: false
      t.float :change_to_formal_work_probability, null: false
      t.float :keep_informal_work_probability, null: false
    end
  end

end
