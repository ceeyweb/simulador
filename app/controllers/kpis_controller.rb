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

  def work
    @user = User.find(cookies["user_id"])
    @user.school_year = school_year

    @kpis = {
      formal_work_probability: WorkUser.new(@user).formal_work_probability,
      work_probability: WorkUser.new(@user).work_probability,
    }

    render json: @kpis.as_json
  end

  def education
    @user = User.find(cookies["user_id"])
    @user.school_year = school_year

    @kpis = {
      education_achievement: EducationAchievement.new(@user.age, school_year).value.round,
      average_income: AverageIncome.new(@user.sex_id, params[:education_level_id], @user.region.id).value.round,

    }

    render json: @kpis.as_json
  end

  private

  def school_year
    EducationLevel.find(params[:education_level_id]).max_school_year
  end

end
