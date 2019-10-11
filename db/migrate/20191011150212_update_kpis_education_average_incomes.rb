class UpdateKpisEducationAverageIncomes < ActiveRecord::Migration[5.2]

  def up
    change_column :kpis_education_average_incomes, :average_income, :float
  end

  def down
    change_column :kpis_education_average_incomes, :average_income, :integer
  end

end
