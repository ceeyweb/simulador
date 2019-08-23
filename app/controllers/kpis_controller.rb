class KpisController < ApplicationController

  def health
    @user = User.find(cookies["user_id"])
    @user.school_year = school_year

    @kpis = {
      life_expectancy: LifeExpectancy.new(
        @user.age,
        @user.sex_id,
        @user.residency_id,
        @user.school_year,
      ).value.round,
    }

    render json: @kpis.as_json
  end

  private

  def school_year
    EducationLevel.find(params[:education_level_id]).max_school_year
  end

end
