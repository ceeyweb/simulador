module EducationHelper
  # rubocop:disable Rails/HelperInstanceVariable
  def tertile_for(user, tertile)
    if tertile == :bottom
      @_bottom_tertile ||= user.sex_tertiles.first
    elsif tertile == :middle
      @_middle_tertile ||= user.sex_tertiles.offset(1).first
    elsif tertile == :top
      @_top_tertile ||= user.sex_tertiles.offset(2).first
    end
  end
  # rubocop:enable Rails/HelperInstanceVariable

  def tertile_image_for(user)
    if user.user_sex_tertile == "1"
      "libros_bajo.png"
    elsif user.user_sex_tertile == "2"
      "libros_medio.png"
    elsif user.user_sex_tertile == "3"
      "libros_alto.png"
    else
      raise NotImplementedError
    end
  end
end
