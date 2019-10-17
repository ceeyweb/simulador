class ProgressUser < SimpleDelegator

  def last_url_path
    return :simulator_start if filled_out_all_parts?
    return :question_part_2 if part_2_is_incomplete?
    :question_part_3
  end

  def part_2_is_incomplete?
    part_2_columns.
      map { |s| __getobj__.public_send(s) }.
      any? { |s| s.nil? }
  end

  def filled_out_all_parts?
    nullable_columns.
      map { |s| __getobj__.public_send(s) }.
      all? { |s| !s.nil? }
  end

  private

  def part_2_columns
    %w[
      father_is_employed
      father_has_healthcare
      father_job_type_id
      father_job_employees_group_id
    ]
  end

  def nullable_columns
    User.columns.select(&:null).map(&:name)
  end

end
