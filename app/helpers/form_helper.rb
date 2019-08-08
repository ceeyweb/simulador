module FormHelper
  def label_for(column)
    QuestionsAdapter.label_for(column)
  end

  def yes_no
    { "Sí": 1, "No": 0, "No Sabe / No Aplica": 2 }
  end
end
